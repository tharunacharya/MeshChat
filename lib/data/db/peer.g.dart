// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'peer.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPeerCollection on Isar {
  IsarCollection<Peer> get peers => this.collection();
}

const PeerSchema = CollectionSchema(
  name: r'Peer',
  id: 1724033309845721673,
  properties: {
    r'connectionAddress': PropertySchema(
      id: 0,
      name: r'connectionAddress',
      type: IsarType.string,
    ),
    r'deviceName': PropertySchema(
      id: 1,
      name: r'deviceName',
      type: IsarType.string,
    ),
    r'isOnline': PropertySchema(
      id: 2,
      name: r'isOnline',
      type: IsarType.bool,
    ),
    r'lastSeen': PropertySchema(
      id: 3,
      name: r'lastSeen',
      type: IsarType.long,
    ),
    r'peerId': PropertySchema(
      id: 4,
      name: r'peerId',
      type: IsarType.string,
    )
  },
  estimateSize: _peerEstimateSize,
  serialize: _peerSerialize,
  deserialize: _peerDeserialize,
  deserializeProp: _peerDeserializeProp,
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
  getId: _peerGetId,
  getLinks: _peerGetLinks,
  attach: _peerAttach,
  version: '3.1.0+1',
);

int _peerEstimateSize(
  Peer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.connectionAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.deviceName.length * 3;
  bytesCount += 3 + object.peerId.length * 3;
  return bytesCount;
}

void _peerSerialize(
  Peer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.connectionAddress);
  writer.writeString(offsets[1], object.deviceName);
  writer.writeBool(offsets[2], object.isOnline);
  writer.writeLong(offsets[3], object.lastSeen);
  writer.writeString(offsets[4], object.peerId);
}

Peer _peerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Peer();
  object.connectionAddress = reader.readStringOrNull(offsets[0]);
  object.deviceName = reader.readString(offsets[1]);
  object.id = id;
  object.isOnline = reader.readBool(offsets[2]);
  object.lastSeen = reader.readLong(offsets[3]);
  object.peerId = reader.readString(offsets[4]);
  return object;
}

P _peerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _peerGetId(Peer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _peerGetLinks(Peer object) {
  return [];
}

void _peerAttach(IsarCollection<dynamic> col, Id id, Peer object) {
  object.id = id;
}

extension PeerByIndex on IsarCollection<Peer> {
  Future<Peer?> getByPeerId(String peerId) {
    return getByIndex(r'peerId', [peerId]);
  }

  Peer? getByPeerIdSync(String peerId) {
    return getByIndexSync(r'peerId', [peerId]);
  }

  Future<bool> deleteByPeerId(String peerId) {
    return deleteByIndex(r'peerId', [peerId]);
  }

  bool deleteByPeerIdSync(String peerId) {
    return deleteByIndexSync(r'peerId', [peerId]);
  }

  Future<List<Peer?>> getAllByPeerId(List<String> peerIdValues) {
    final values = peerIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'peerId', values);
  }

  List<Peer?> getAllByPeerIdSync(List<String> peerIdValues) {
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

  Future<Id> putByPeerId(Peer object) {
    return putByIndex(r'peerId', object);
  }

  Id putByPeerIdSync(Peer object, {bool saveLinks = true}) {
    return putByIndexSync(r'peerId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByPeerId(List<Peer> objects) {
    return putAllByIndex(r'peerId', objects);
  }

  List<Id> putAllByPeerIdSync(List<Peer> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'peerId', objects, saveLinks: saveLinks);
  }
}

extension PeerQueryWhereSort on QueryBuilder<Peer, Peer, QWhere> {
  QueryBuilder<Peer, Peer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PeerQueryWhere on QueryBuilder<Peer, Peer, QWhereClause> {
  QueryBuilder<Peer, Peer, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Peer, Peer, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Peer, Peer, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Peer, Peer, QAfterWhereClause> idBetween(
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

  QueryBuilder<Peer, Peer, QAfterWhereClause> peerIdEqualTo(String peerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'peerId',
        value: [peerId],
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterWhereClause> peerIdNotEqualTo(String peerId) {
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

extension PeerQueryFilter on QueryBuilder<Peer, Peer, QFilterCondition> {
  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'connectionAddress',
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'connectionAddress',
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectionAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'connectionAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'connectionAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'connectionAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'connectionAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'connectionAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'connectionAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'connectionAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> connectionAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'connectionAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition>
      connectionAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'connectionAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'deviceName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'deviceName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceName',
        value: '',
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> deviceNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'deviceName',
        value: '',
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> isOnlineEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isOnline',
        value: value,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> lastSeenEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> lastSeenGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> lastSeenLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSeen',
        value: value,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> lastSeenBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSeen',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdEqualTo(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdGreaterThan(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdLessThan(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdBetween(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdStartsWith(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdEndsWith(
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

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'peerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'peerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'peerId',
        value: '',
      ));
    });
  }

  QueryBuilder<Peer, Peer, QAfterFilterCondition> peerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'peerId',
        value: '',
      ));
    });
  }
}

extension PeerQueryObject on QueryBuilder<Peer, Peer, QFilterCondition> {}

extension PeerQueryLinks on QueryBuilder<Peer, Peer, QFilterCondition> {}

extension PeerQuerySortBy on QueryBuilder<Peer, Peer, QSortBy> {
  QueryBuilder<Peer, Peer, QAfterSortBy> sortByConnectionAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionAddress', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByConnectionAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionAddress', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByDeviceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByDeviceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByLastSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByLastSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByPeerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> sortByPeerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.desc);
    });
  }
}

extension PeerQuerySortThenBy on QueryBuilder<Peer, Peer, QSortThenBy> {
  QueryBuilder<Peer, Peer, QAfterSortBy> thenByConnectionAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionAddress', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByConnectionAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'connectionAddress', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByDeviceName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByDeviceNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceName', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByIsOnlineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isOnline', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByLastSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByLastSeenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSeen', Sort.desc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByPeerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.asc);
    });
  }

  QueryBuilder<Peer, Peer, QAfterSortBy> thenByPeerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'peerId', Sort.desc);
    });
  }
}

extension PeerQueryWhereDistinct on QueryBuilder<Peer, Peer, QDistinct> {
  QueryBuilder<Peer, Peer, QDistinct> distinctByConnectionAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'connectionAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Peer, Peer, QDistinct> distinctByDeviceName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'deviceName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Peer, Peer, QDistinct> distinctByIsOnline() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isOnline');
    });
  }

  QueryBuilder<Peer, Peer, QDistinct> distinctByLastSeen() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSeen');
    });
  }

  QueryBuilder<Peer, Peer, QDistinct> distinctByPeerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'peerId', caseSensitive: caseSensitive);
    });
  }
}

extension PeerQueryProperty on QueryBuilder<Peer, Peer, QQueryProperty> {
  QueryBuilder<Peer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Peer, String?, QQueryOperations> connectionAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'connectionAddress');
    });
  }

  QueryBuilder<Peer, String, QQueryOperations> deviceNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceName');
    });
  }

  QueryBuilder<Peer, bool, QQueryOperations> isOnlineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isOnline');
    });
  }

  QueryBuilder<Peer, int, QQueryOperations> lastSeenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSeen');
    });
  }

  QueryBuilder<Peer, String, QQueryOperations> peerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'peerId');
    });
  }
}
