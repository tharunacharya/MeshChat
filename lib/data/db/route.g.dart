// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMeshRouteCollection on Isar {
  IsarCollection<MeshRoute> get meshRoutes => this.collection();
}

const MeshRouteSchema = CollectionSchema(
  name: r'MeshRoute',
  id: -586046244472644187,
  properties: {
    r'destinationId': PropertySchema(
      id: 0,
      name: r'destinationId',
      type: IsarType.string,
    ),
    r'hopCount': PropertySchema(
      id: 1,
      name: r'hopCount',
      type: IsarType.long,
    ),
    r'nextHopId': PropertySchema(
      id: 2,
      name: r'nextHopId',
      type: IsarType.string,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.long,
    )
  },
  estimateSize: _meshRouteEstimateSize,
  serialize: _meshRouteSerialize,
  deserialize: _meshRouteDeserialize,
  deserializeProp: _meshRouteDeserializeProp,
  idName: r'id',
  indexes: {
    r'destinationId': IndexSchema(
      id: -6641374924133285701,
      name: r'destinationId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'destinationId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _meshRouteGetId,
  getLinks: _meshRouteGetLinks,
  attach: _meshRouteAttach,
  version: '3.1.0+1',
);

int _meshRouteEstimateSize(
  MeshRoute object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.destinationId.length * 3;
  bytesCount += 3 + object.nextHopId.length * 3;
  return bytesCount;
}

void _meshRouteSerialize(
  MeshRoute object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.destinationId);
  writer.writeLong(offsets[1], object.hopCount);
  writer.writeString(offsets[2], object.nextHopId);
  writer.writeLong(offsets[3], object.timestamp);
}

MeshRoute _meshRouteDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MeshRoute();
  object.destinationId = reader.readString(offsets[0]);
  object.hopCount = reader.readLong(offsets[1]);
  object.id = id;
  object.nextHopId = reader.readString(offsets[2]);
  object.timestamp = reader.readLong(offsets[3]);
  return object;
}

P _meshRouteDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _meshRouteGetId(MeshRoute object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _meshRouteGetLinks(MeshRoute object) {
  return [];
}

void _meshRouteAttach(IsarCollection<dynamic> col, Id id, MeshRoute object) {
  object.id = id;
}

extension MeshRouteByIndex on IsarCollection<MeshRoute> {
  Future<MeshRoute?> getByDestinationId(String destinationId) {
    return getByIndex(r'destinationId', [destinationId]);
  }

  MeshRoute? getByDestinationIdSync(String destinationId) {
    return getByIndexSync(r'destinationId', [destinationId]);
  }

  Future<bool> deleteByDestinationId(String destinationId) {
    return deleteByIndex(r'destinationId', [destinationId]);
  }

  bool deleteByDestinationIdSync(String destinationId) {
    return deleteByIndexSync(r'destinationId', [destinationId]);
  }

  Future<List<MeshRoute?>> getAllByDestinationId(
      List<String> destinationIdValues) {
    final values = destinationIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'destinationId', values);
  }

  List<MeshRoute?> getAllByDestinationIdSync(List<String> destinationIdValues) {
    final values = destinationIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'destinationId', values);
  }

  Future<int> deleteAllByDestinationId(List<String> destinationIdValues) {
    final values = destinationIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'destinationId', values);
  }

  int deleteAllByDestinationIdSync(List<String> destinationIdValues) {
    final values = destinationIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'destinationId', values);
  }

  Future<Id> putByDestinationId(MeshRoute object) {
    return putByIndex(r'destinationId', object);
  }

  Id putByDestinationIdSync(MeshRoute object, {bool saveLinks = true}) {
    return putByIndexSync(r'destinationId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDestinationId(List<MeshRoute> objects) {
    return putAllByIndex(r'destinationId', objects);
  }

  List<Id> putAllByDestinationIdSync(List<MeshRoute> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'destinationId', objects, saveLinks: saveLinks);
  }
}

extension MeshRouteQueryWhereSort
    on QueryBuilder<MeshRoute, MeshRoute, QWhere> {
  QueryBuilder<MeshRoute, MeshRoute, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MeshRouteQueryWhere
    on QueryBuilder<MeshRoute, MeshRoute, QWhereClause> {
  QueryBuilder<MeshRoute, MeshRoute, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<MeshRoute, MeshRoute, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterWhereClause> idBetween(
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

  QueryBuilder<MeshRoute, MeshRoute, QAfterWhereClause> destinationIdEqualTo(
      String destinationId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'destinationId',
        value: [destinationId],
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterWhereClause> destinationIdNotEqualTo(
      String destinationId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [],
              upper: [destinationId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [destinationId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [destinationId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'destinationId',
              lower: [],
              upper: [destinationId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension MeshRouteQueryFilter
    on QueryBuilder<MeshRoute, MeshRoute, QFilterCondition> {
  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destinationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destinationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destinationId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destinationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destinationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destinationId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destinationId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destinationId',
        value: '',
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      destinationIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destinationId',
        value: '',
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> hopCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hopCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> hopCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hopCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> hopCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hopCount',
        value: value,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> hopCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hopCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> idBetween(
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

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextHopId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      nextHopIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextHopId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextHopId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextHopId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nextHopId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nextHopId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nextHopId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nextHopId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> nextHopIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextHopId',
        value: '',
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
      nextHopIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nextHopId',
        value: '',
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> timestampEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition>
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

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> timestampLessThan(
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

  QueryBuilder<MeshRoute, MeshRoute, QAfterFilterCondition> timestampBetween(
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

extension MeshRouteQueryObject
    on QueryBuilder<MeshRoute, MeshRoute, QFilterCondition> {}

extension MeshRouteQueryLinks
    on QueryBuilder<MeshRoute, MeshRoute, QFilterCondition> {}

extension MeshRouteQuerySortBy on QueryBuilder<MeshRoute, MeshRoute, QSortBy> {
  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByDestinationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.desc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByHopCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hopCount', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByHopCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hopCount', Sort.desc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByNextHopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHopId', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByNextHopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHopId', Sort.desc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MeshRouteQuerySortThenBy
    on QueryBuilder<MeshRoute, MeshRoute, QSortThenBy> {
  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByDestinationId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByDestinationIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destinationId', Sort.desc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByHopCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hopCount', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByHopCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hopCount', Sort.desc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByNextHopId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHopId', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByNextHopIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextHopId', Sort.desc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension MeshRouteQueryWhereDistinct
    on QueryBuilder<MeshRoute, MeshRoute, QDistinct> {
  QueryBuilder<MeshRoute, MeshRoute, QDistinct> distinctByDestinationId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destinationId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QDistinct> distinctByHopCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hopCount');
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QDistinct> distinctByNextHopId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextHopId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MeshRoute, MeshRoute, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension MeshRouteQueryProperty
    on QueryBuilder<MeshRoute, MeshRoute, QQueryProperty> {
  QueryBuilder<MeshRoute, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MeshRoute, String, QQueryOperations> destinationIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destinationId');
    });
  }

  QueryBuilder<MeshRoute, int, QQueryOperations> hopCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hopCount');
    });
  }

  QueryBuilder<MeshRoute, String, QQueryOperations> nextHopIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextHopId');
    });
  }

  QueryBuilder<MeshRoute, int, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
