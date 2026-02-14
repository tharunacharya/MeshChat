// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_message.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQueuedMessageCollection on Isar {
  IsarCollection<QueuedMessage> get queuedMessages => this.collection();
}

const QueuedMessageSchema = CollectionSchema(
  name: r'QueuedMessage',
  id: -3622045784150182487,
  properties: {
    r'packetJson': PropertySchema(
      id: 0,
      name: r'packetJson',
      type: IsarType.string,
    ),
    r'receiverId': PropertySchema(
      id: 1,
      name: r'receiverId',
      type: IsarType.string,
    ),
    r'retryCount': PropertySchema(
      id: 2,
      name: r'retryCount',
      type: IsarType.long,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.long,
    )
  },
  estimateSize: _queuedMessageEstimateSize,
  serialize: _queuedMessageSerialize,
  deserialize: _queuedMessageDeserialize,
  deserializeProp: _queuedMessageDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _queuedMessageGetId,
  getLinks: _queuedMessageGetLinks,
  attach: _queuedMessageAttach,
  version: '3.1.0+1',
);

int _queuedMessageEstimateSize(
  QueuedMessage object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.packetJson.length * 3;
  bytesCount += 3 + object.receiverId.length * 3;
  return bytesCount;
}

void _queuedMessageSerialize(
  QueuedMessage object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.packetJson);
  writer.writeString(offsets[1], object.receiverId);
  writer.writeLong(offsets[2], object.retryCount);
  writer.writeLong(offsets[3], object.timestamp);
}

QueuedMessage _queuedMessageDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QueuedMessage();
  object.id = id;
  object.packetJson = reader.readString(offsets[0]);
  object.receiverId = reader.readString(offsets[1]);
  object.retryCount = reader.readLong(offsets[2]);
  object.timestamp = reader.readLong(offsets[3]);
  return object;
}

P _queuedMessageDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _queuedMessageGetId(QueuedMessage object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _queuedMessageGetLinks(QueuedMessage object) {
  return [];
}

void _queuedMessageAttach(
    IsarCollection<dynamic> col, Id id, QueuedMessage object) {
  object.id = id;
}

extension QueuedMessageQueryWhereSort
    on QueryBuilder<QueuedMessage, QueuedMessage, QWhere> {
  QueryBuilder<QueuedMessage, QueuedMessage, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QueuedMessageQueryWhere
    on QueryBuilder<QueuedMessage, QueuedMessage, QWhereClause> {
  QueryBuilder<QueuedMessage, QueuedMessage, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterWhereClause> idBetween(
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

extension QueuedMessageQueryFilter
    on QueryBuilder<QueuedMessage, QueuedMessage, QFilterCondition> {
  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition> idBetween(
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

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packetJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packetJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packetJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packetJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'packetJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'packetJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'packetJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'packetJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packetJson',
        value: '',
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      packetJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'packetJson',
        value: '',
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverId',
        value: '',
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      receiverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverId',
        value: '',
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      retryCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      retryCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      retryCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'retryCount',
        value: value,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      retryCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'retryCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      timestampEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      timestampGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      timestampLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterFilterCondition>
      timestampBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QueuedMessageQueryObject
    on QueryBuilder<QueuedMessage, QueuedMessage, QFilterCondition> {}

extension QueuedMessageQueryLinks
    on QueryBuilder<QueuedMessage, QueuedMessage, QFilterCondition> {}

extension QueuedMessageQuerySortBy
    on QueryBuilder<QueuedMessage, QueuedMessage, QSortBy> {
  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> sortByPacketJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packetJson', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      sortByPacketJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packetJson', Sort.desc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> sortByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      sortByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> sortByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      sortByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension QueuedMessageQuerySortThenBy
    on QueryBuilder<QueuedMessage, QueuedMessage, QSortThenBy> {
  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> thenByPacketJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packetJson', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      thenByPacketJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packetJson', Sort.desc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> thenByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      thenByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> thenByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      thenByRetryCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'retryCount', Sort.desc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QAfterSortBy>
      thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension QueuedMessageQueryWhereDistinct
    on QueryBuilder<QueuedMessage, QueuedMessage, QDistinct> {
  QueryBuilder<QueuedMessage, QueuedMessage, QDistinct> distinctByPacketJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packetJson', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QDistinct> distinctByReceiverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QDistinct> distinctByRetryCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'retryCount');
    });
  }

  QueryBuilder<QueuedMessage, QueuedMessage, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension QueuedMessageQueryProperty
    on QueryBuilder<QueuedMessage, QueuedMessage, QQueryProperty> {
  QueryBuilder<QueuedMessage, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QueuedMessage, String, QQueryOperations> packetJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packetJson');
    });
  }

  QueryBuilder<QueuedMessage, String, QQueryOperations> receiverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverId');
    });
  }

  QueryBuilder<QueuedMessage, int, QQueryOperations> retryCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'retryCount');
    });
  }

  QueryBuilder<QueuedMessage, int, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
