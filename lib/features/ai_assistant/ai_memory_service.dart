
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:isar/isar.dart';
import '../../data/local_db/local_database.dart';
import '../../data/db/memory_fact.dart';
import '../../data/db/message.dart';

class AiMemoryService {
  final Isar _isar = LocalDatabase.instance.isar;
  static const _apiKey = "YOUR_GEMINI_API_KEY"; // TODO: User input
  late final GenerativeModel? _model;

  AiMemoryService() {
    if (_apiKey != "YOUR_GEMINI_API_KEY") {
      _model = GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);
    } else {
      _model = null;
    }
  }

  // 1. Extract Facts from Message
  Future<void> analyzeMessage(Message message) async {
    final text = message.content;
    String? extractedFact;
    String category = "general";
    double confidence = 0.5;

    if (_model != null) {
      try {
        final prompt = [
          Content.text("""
          Analyze this chat message and extract any permanent personal fact, preference, or plan.
          If nothing interesting, return "NULL".
          Format: "Category: Fact"
          Categories: Preference, Identity, Plan, Relationship.
          
          Message: "$text"
          """)
        ];
        final response = await _model!.generateContent(prompt);
        final output = response.text?.trim() ?? "NULL";
        
        if (output != "NULL" && output.contains(":")) {
           final parts = output.split(":");
           category = parts[0].trim();
           extractedFact = parts.sublist(1).join(":").trim();
           confidence = 0.9;
        }
      } catch (e) {
        print("Gemini Extraction Error: $e");
      }
    }

    // Fallback Heuristics
    if (extractedFact == null) {
      final lower = text.toLowerCase();
      if (lower.contains("i like") || lower.contains("i love")) {
         extractedFact = "User preference: $text";
         category = "Preference";
      } else if (lower.contains("remind me") || lower.contains("don't forget")) {
         extractedFact = "Task: $text";
         category = "Plan";
      } else if (lower.contains("my name is")) {
         extractedFact = "Identity: $text";
         category = "Identity";
      }
    }

    if (extractedFact != null) {
      final fact = MemoryFact()
        ..fact = extractedFact
        ..category = category
        ..confidence = confidence
        ..sourceMessageId = message.messageId
        ..createdAt = DateTime.now().millisecondsSinceEpoch;

      await _isar.writeTxn(() async {
        await _isar.memoryFacts.put(fact);
      });
      print("🧠 AI Memory Stored: [$category] $extractedFact");
    }
  }

  Future<List<MemoryFact>> getMemories() async {
    return await _isar.memoryFacts.where().sortByCreatedAtDesc().findAll();
  }

  // 2. Suggest Reply (RAG)
  Future<String?> suggestReply(String incomingMessage) async {
    final memories = await getMemories();
    // Simple Retrieve: Get last 5 relevant memories
    final contextFacts = memories.take(10).map((m) => "- ${m.fact}").join("\n");

    if (_model != null) {
      try {
         final prompt = [
           Content.text("""
           You are MeshTalk AI. Suggest a short, smart reply to this message based on the user's memories.
           
           User Memories:
           $contextFacts
           
           Incoming Message: "$incomingMessage"
           
           Reply (just the text):
           """)
         ];
         final response = await _model!.generateContent(prompt);
         return response.text;
      } catch (e) {
         print("Gemini Reply Error: $e");
      }
    }
    
    // Fallback
    if (incomingMessage.toLowerCase().contains("do you know")) {
        for (var m in memories) {
           if (incomingMessage.toLowerCase().contains(m.category.toLowerCase())) {
              return "Recall: ${m.fact}";
           }
        }
    }
    return null; 
  }
}
