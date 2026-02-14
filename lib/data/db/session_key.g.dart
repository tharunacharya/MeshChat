// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_key.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSessionKeyCollection on Isar {
  IsarCollection<SessionKey> get sessionKeys => this.collection();
}

const SessionKeySchema = CollectionSchema(
  name: r'SessionKey',
  id: -7908581254390262089,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.long,
    ),
    r'peerId': PropertySchema(
      id: 1,
      name: r'peerId',
      type: IsarType.string,
    ),
    r'sharedSecret': PropertySchema(
      id: 2,
      name: r'sharedSecret',
      type: IsarType.byteList,
    )
  },
  estimateSize: _sessionKeyEstimateSize,
  serialize: _sessionKeySerialize,
  deserialize: _sessionKeyDeserialize,
  deserializeProp: _sessionKeyDeserializeProp,
  idName: r'id',
  indexes: {
    r'peerId': IndexSchema(
      id: -9089303509033685807,
      name: r'peerId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'peerId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _sessionKeyGetId,
  getLinks: _sessionKeyGetLinks,
  attach: _sessionKeyAttach,
  version: '3.1.0+1',
);

int _sessionKeyEstimateSize(
  SessionKey object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.peerId.length * 3;
  bytesCount += 3 + object.sharedSecret.length;
  return bytesCount;
}

void _sessionKeySerialize(
  SessionKey object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.createdAt);
  writer.writeString(offsets[1], object.peerId);
  writer.writeByteList(offsets[2], object.sharedSecret);
}

SessionKey _sessionKeyDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SessionKey();
  object.createdAt = reader.readLong(offsets[0]);
  object.id = id;
  object.peerId = reader.readString(offsets[1]);
  object.sharedSecret = reader.readByteList(offsets[2]) ?? [];
  return object;
}

P _sessionKeyDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readByteList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _sessionKeyGetId(SessionKey object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _sessionKeyGetLinks(SessionKey object) {
  return [];
}

void _sessionKeyAttach(IsarCollection<dynamic> col, Id id, SessionKey object) {
  object.id = id;
}

extension SessionKeyByIndex on IsarCollection<SessionKey> {
  Future<SessionKey?> getByPeerId(String peerId) {
    return getByIndex(r'peerId', [peerId]);
  }

  SessionKey? getByPeerIdSync(String peerId) {
    return getByIndexSync(r'peerId', [peerId]);
  }

  Future<bool> deleteByPeerId(String peerId) {
    return deleteByIndex(r'peerId', [peerId]);
  }

  bool deleteByPeerIdSync(String peerId) {
    return deleteByIndexSync(r'peerId', [peerId]);
  }

  Future<List<SessionKey?>> getAllByPeerId(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'peerId', values);
  }

  List<SessionKey?> getAllByPeerIdSync(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'peerId', values);
  }

  Future<int> deleteAllByPeerId(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'peerId', values);
  }

  int deleteAllByPeerIdSync(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'peerId', values);
  }

  Future<Id> putByPeerId(SessionKey object) {
    return putByIndex(r'peerId', object);
  }

  Id putByPeerIdSync(SessionKey object, {bool saveLinks = true}) {
    return putByIndexSync(r'peerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPeerId(List<SessionKey> objects) {
    return putAllByIndex(r'peerId', objects);
  }

  List<Id> putAllByPeerIdSync(List<SessionKey> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'peerId', objects, saveLinks: saveLinks);
  }
}

extension SessionKeyQueryWhereSort
    on QueryBuilder<SessionKey, SessionKey, QWhere> {
  QueryBuilder<SessionKey, SessionKey, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SessionKeyQueryWhere
    on QueryBuilder<SessionKey, SessionKey, QWhereClause> {
  QueryBuilder<SessionKey, SessionKey, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SessionKey, SessionKey, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterWhereClause> idBetween(
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

  QueryBuilder<SessionKey, SessionKey, QAfterWhereClause> peerIdEqualTo(
      String peerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'peerId',
        value: [peerId],
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterWhereClause> peerIdNotEqualTo(
      String peerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'peerId',
              lower: [],
              upper: [peerId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'peerId',
              lower: [peerId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'peerId',
              lower: [peerId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'peerId',
              lower: [],
              upper: [peerId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SessionKeyQueryFilter
    on QueryBuilder<SessionKey, SessionKey, QFilterCondition> {
  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> createdAtEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
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

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> createdAtLessThan(
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

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> createdAtBetween(
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

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'peerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'peerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'peerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'peerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'peerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'peerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'peerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'peerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition> peerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'peerId',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      peerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'peerId',
        value: '',
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sharedSecret',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sharedSecret',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sharedSecret',
        value: value,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sharedSecret',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sharedSecret',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sharedSecret',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sharedSecret',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sharedSecret',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sharedSecret',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterFilterCondition>
      sharedSecretLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'sharedSecret',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SessionKeyQueryObject
    on QueryBuilder<SessionKey, SessionKey, QFilterCondition> {}

extension SessionKeyQueryLinks
    on QueryBuilder<SessionKey, SessionKey, QFilterCondition> {}

extension SessionKeyQuerySortBy
    on QueryBuilder<SessionKey, SessionKey, QSortBy> {
  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> sortByPeerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.asc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> sortByPeerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.desc);
    });
  }
}

extension SessionKeyQuerySortThenBy
    on QueryBuilder<SessionKey, SessionKey, QSortThenBy> {
  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> thenByPeerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.asc);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QAfterSortBy> thenByPeerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.desc);
    });
  }
}

extension SessionKeyQueryWhereDistinct
    on QueryBuilder<SessionKey, SessionKey, QDistinct> {
  QueryBuilder<SessionKey, SessionKey, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<SessionKey, SessionKey, QDistinct> distinctByPeerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'peerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SessionKey, SessionKey, QDistinct> distinctBySharedSecret() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sharedSecret');
    });
  }
}

extension SessionKeyQueryProperty
    on QueryBuilder<SessionKey, SessionKey, QQueryProperty> {
  QueryBuilder<SessionKey, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SessionKey, int, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<SessionKey, String, QQueryOperations> peerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'peerId');
    });
  }

  QueryBuilder<SessionKey, List<int>, QQueryOperations> sharedSecretProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sharedSecret');
    });
  }
}
