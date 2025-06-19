// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantEntity {

 String get id; DateTime? get creationDate; DateTime? get lastUpdateDate; String get name; String get species; String? get careNotes; String get userId;
/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantEntityCopyWith<PlantEntity> get copyWith => _$PlantEntityCopyWithImpl<PlantEntity>(this as PlantEntity, _$identity);

  /// Serializes this PlantEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.careNotes, careNotes) || other.careNotes == careNotes)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,species,careNotes,userId);

@override
String toString() {
  return 'PlantEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, species: $species, careNotes: $careNotes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $PlantEntityCopyWith<$Res>  {
  factory $PlantEntityCopyWith(PlantEntity value, $Res Function(PlantEntity) _then) = _$PlantEntityCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String species, String? careNotes, String userId
});




}
/// @nodoc
class _$PlantEntityCopyWithImpl<$Res>
    implements $PlantEntityCopyWith<$Res> {
  _$PlantEntityCopyWithImpl(this._self, this._then);

  final PlantEntity _self;
  final $Res Function(PlantEntity) _then;

/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? species = null,Object? careNotes = freezed,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,careNotes: freezed == careNotes ? _self.careNotes : careNotes // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlantEntity extends PlantEntity {
  const _PlantEntity({required this.id, this.creationDate, this.lastUpdateDate, required this.name, required this.species, this.careNotes, required this.userId}): super._();
  factory _PlantEntity.fromJson(Map<String, dynamic> json) => _$PlantEntityFromJson(json);

@override final  String id;
@override final  DateTime? creationDate;
@override final  DateTime? lastUpdateDate;
@override final  String name;
@override final  String species;
@override final  String? careNotes;
@override final  String userId;

/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantEntityCopyWith<_PlantEntity> get copyWith => __$PlantEntityCopyWithImpl<_PlantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlantEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.careNotes, careNotes) || other.careNotes == careNotes)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,species,careNotes,userId);

@override
String toString() {
  return 'PlantEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, species: $species, careNotes: $careNotes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$PlantEntityCopyWith<$Res> implements $PlantEntityCopyWith<$Res> {
  factory _$PlantEntityCopyWith(_PlantEntity value, $Res Function(_PlantEntity) _then) = __$PlantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String species, String? careNotes, String userId
});




}
/// @nodoc
class __$PlantEntityCopyWithImpl<$Res>
    implements _$PlantEntityCopyWith<$Res> {
  __$PlantEntityCopyWithImpl(this._self, this._then);

  final _PlantEntity _self;
  final $Res Function(_PlantEntity) _then;

/// Create a copy of PlantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? species = null,Object? careNotes = freezed,Object? userId = null,}) {
  return _then(_PlantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,species: null == species ? _self.species : species // ignore: cast_nullable_to_non_nullable
as String,careNotes: freezed == careNotes ? _self.careNotes : careNotes // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
