// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_fact.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMemoryFactCollection on Isar {
  IsarCollection<MemoryFact> get memoryFacts => this.collection();
}

const MemoryFactSchema = CollectionSchema(
  name: r'MemoryFact',
  id: -8307598497524054557,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.string,
    ),
    r'confidence': PropertySchema(
      id: 1,
      name: r'confidence',
      type: IsarType.double,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'fact': PropertySchema(
      id: 3,
      name: r'fact',
      type: IsarType.string,
    ),
    r'sourceMessageId': PropertySchema(
      id: 4,
      name: r'sourceMessageId',
      type: IsarType.string,
    )
  },
  estimateSize: _memoryFactEstimateSize,
  serialize: _memoryFactSerialize,
  deserialize: _memoryFactDeserialize,
  deserializeProp: _memoryFactDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _memoryFactGetId,
  getLinks: _memoryFactGetLinks,
  attach: _memoryFactAttach,
  version: '3.1.0+1',
);

int _memoryFactEstimateSize(
  MemoryFact object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.category.length * 3;
  bytesCount += 3 + object.fact.length * 3;
  bytesCount += 3 + object.sourceMessageId.length * 3;
  return bytesCount;
}

void _memoryFactSerialize(
  MemoryFact object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.category);
  writer.writeDouble(offsets[1], object.confidence);
  writer.writeLong(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.fact);
  writer.writeString(offsets[4], object.sourceMessageId);
}

MemoryFact _memoryFactDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MemoryFact();
  object.category = reader.readString(offsets[0]);
  object.confidence = reader.readDouble(offsets[1]);
  object.createdAt = reader.readLong(offsets[2]);
  object.fact = reader.readString(offsets[3]);
  object.id = id;
  object.sourceMessageId = reader.readString(offsets[4]);
  return object;
}

P _memoryFactDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _memoryFactGetId(MemoryFact object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _memoryFactGetLinks(MemoryFact object) {
  return [];
}

void _memoryFactAttach(IsarCollection<dynamic> col, Id id, MemoryFact object) {
  object.id = id;
}

extension MemoryFactQueryWhereSort
    on QueryBuilder<MemoryFact, MemoryFact, QWhere> {
  QueryBuilder<MemoryFact, MemoryFact, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MemoryFactQueryWhere
    on QueryBuilder<MemoryFact, MemoryFact, QWhereClause> {
  QueryBuilder<MemoryFact, MemoryFact, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MemoryFactQueryFilter
    on QueryBuilder<MemoryFact, MemoryFact, QFilterCondition> {
  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> categoryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      categoryGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> categoryLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> categoryBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'category',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      categoryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> categoryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> categoryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'category',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> categoryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'category',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      categoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      categoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'category',
        value: '',
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> confidenceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      confidenceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      confidenceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'confidence',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> confidenceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'confidence',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> createdAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      createdAtGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> createdAtLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> createdAtBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fact',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fact',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fact',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fact',
        value: '',
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> factIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fact',
        value: '',
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceMessageId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceMessageId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceMessageId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceMessageId',
        value: '',
      ));
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterFilterCondition>
      sourceMessageIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceMessageId',
        value: '',
      ));
    });
  }
}

extension MemoryFactQueryObject
    on QueryBuilder<MemoryFact, MemoryFact, QFilterCondition> {}

extension MemoryFactQueryLinks
    on QueryBuilder<MemoryFact, MemoryFact, QFilterCondition> {}

extension MemoryFactQuerySortBy
    on QueryBuilder<MemoryFact, MemoryFact, QSortBy> {
  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByFact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fact', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortByFactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fact', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> sortBySourceMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceMessageId', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy>
      sortBySourceMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceMessageId', Sort.desc);
    });
  }
}

extension MemoryFactQuerySortThenBy
    on QueryBuilder<MemoryFact, MemoryFact, QSortThenBy> {
  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByConfidenceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'confidence', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByFact() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fact', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByFactDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fact', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy> thenBySourceMessageId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceMessageId', Sort.asc);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QAfterSortBy>
      thenBySourceMessageIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceMessageId', Sort.desc);
    });
  }
}

extension MemoryFactQueryWhereDistinct
    on QueryBuilder<MemoryFact, MemoryFact, QDistinct> {
  QueryBuilder<MemoryFact, MemoryFact, QDistinct> distinctByCategory(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QDistinct> distinctByConfidence() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'confidence');
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QDistinct> distinctByFact(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fact', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MemoryFact, MemoryFact, QDistinct> distinctBySourceMessageId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceMessageId',
          caseSensitive: caseSensitive);
    });
  }
}

extension MemoryFactQueryProperty
    on QueryBuilder<MemoryFact, MemoryFact, QQueryProperty> {
  QueryBuilder<MemoryFact, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MemoryFact, String, QQueryOperations> categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<MemoryFact, double, QQueryOperations> confidenceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'confidence');
    });
  }

  QueryBuilder<MemoryFact, int, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<MemoryFact, String, QQueryOperations> factProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fact');
    });
  }

  QueryBuilder<MemoryFact, String, QQueryOperations> sourceMessageIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceMessageId');
    });
  }
}
