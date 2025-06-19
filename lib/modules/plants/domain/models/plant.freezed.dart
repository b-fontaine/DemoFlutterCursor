// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Plant {

 String get id; DateTime? get creationDate; DateTime? get lastUpdateDate; String get name; String get species; String? get careNotes; String get userId;
/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantCopyWith<Plant> get copyWith => _$PlantCopyWithImpl<Plant>(this as Plant, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plant&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.careNotes, careNotes) || other.careNotes == careNotes)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,species,careNotes,userId);

@override
String toString() {
  return 'Plant(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, species: $species, careNotes: $careNotes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $PlantCopyWith<$Res>  {
  factory $PlantCopyWith(Plant value, $Res Function(Plant) _then) = _$PlantCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String species, String? careNotes, String userId
});




}
/// @nodoc
class _$PlantCopyWithImpl<$Res>
    implements $PlantCopyWith<$Res> {
  _$PlantCopyWithImpl(this._self, this._then);

  final Plant _self;
  final $Res Function(Plant) _then;

/// Create a copy of Plant
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


class _Plant extends Plant {
  const _Plant({required this.id, this.creationDate, this.lastUpdateDate, required this.name, required this.species, this.careNotes, required this.userId}): super._();
  

@override final  String id;
@override final  DateTime? creationDate;
@override final  DateTime? lastUpdateDate;
@override final  String name;
@override final  String species;
@override final  String? careNotes;
@override final  String userId;

/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantCopyWith<_Plant> get copyWith => __$PlantCopyWithImpl<_Plant>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plant&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.careNotes, careNotes) || other.careNotes == careNotes)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,species,careNotes,userId);

@override
String toString() {
  return 'Plant(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, species: $species, careNotes: $careNotes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$PlantCopyWith<$Res> implements $PlantCopyWith<$Res> {
  factory _$PlantCopyWith(_Plant value, $Res Function(_Plant) _then) = __$PlantCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String species, String? careNotes, String userId
});




}
/// @nodoc
class __$PlantCopyWithImpl<$Res>
    implements _$PlantCopyWith<$Res> {
  __$PlantCopyWithImpl(this._self, this._then);

  final _Plant _self;
  final $Res Function(_Plant) _then;

/// Create a copy of Plant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? species = null,Object? careNotes = freezed,Object? userId = null,}) {
  return _then(_Plant(
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
