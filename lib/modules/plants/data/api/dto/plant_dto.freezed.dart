// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlantDTO {

 String? get id;@JsonKey(name: 'creation_date') DateTime? get creationDate;@JsonKey(name: 'last_update_date') DateTime? get lastUpdateDate; String get name; String get species;@JsonKey(name: 'care_notes') String? get careNotes;@JsonKey(name: 'user_id') String get userId;
/// Create a copy of PlantDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantDTOCopyWith<PlantDTO> get copyWith => _$PlantDTOCopyWithImpl<PlantDTO>(this as PlantDTO, _$identity);

  /// Serializes this PlantDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.careNotes, careNotes) || other.careNotes == careNotes)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,species,careNotes,userId);

@override
String toString() {
  return 'PlantDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, species: $species, careNotes: $careNotes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $PlantDTOCopyWith<$Res>  {
  factory $PlantDTOCopyWith(PlantDTO value, $Res Function(PlantDTO) _then) = _$PlantDTOCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate, String name, String species,@JsonKey(name: 'care_notes') String? careNotes,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class _$PlantDTOCopyWithImpl<$Res>
    implements $PlantDTOCopyWith<$Res> {
  _$PlantDTOCopyWithImpl(this._self, this._then);

  final PlantDTO _self;
  final $Res Function(PlantDTO) _then;

/// Create a copy of PlantDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? species = null,Object? careNotes = freezed,Object? userId = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
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

class _PlantDTO extends PlantDTO {
  const _PlantDTO({this.id, @JsonKey(name: 'creation_date') this.creationDate, @JsonKey(name: 'last_update_date') this.lastUpdateDate, required this.name, required this.species, @JsonKey(name: 'care_notes') this.careNotes, @JsonKey(name: 'user_id') required this.userId}): super._();
  factory _PlantDTO.fromJson(Map<String, dynamic> json) => _$PlantDTOFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'creation_date') final  DateTime? creationDate;
@override@JsonKey(name: 'last_update_date') final  DateTime? lastUpdateDate;
@override final  String name;
@override final  String species;
@override@JsonKey(name: 'care_notes') final  String? careNotes;
@override@JsonKey(name: 'user_id') final  String userId;

/// Create a copy of PlantDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantDTOCopyWith<_PlantDTO> get copyWith => __$PlantDTOCopyWithImpl<_PlantDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlantDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.species, species) || other.species == species)&&(identical(other.careNotes, careNotes) || other.careNotes == careNotes)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,species,careNotes,userId);

@override
String toString() {
  return 'PlantDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, species: $species, careNotes: $careNotes, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$PlantDTOCopyWith<$Res> implements $PlantDTOCopyWith<$Res> {
  factory _$PlantDTOCopyWith(_PlantDTO value, $Res Function(_PlantDTO) _then) = __$PlantDTOCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate, String name, String species,@JsonKey(name: 'care_notes') String? careNotes,@JsonKey(name: 'user_id') String userId
});




}
/// @nodoc
class __$PlantDTOCopyWithImpl<$Res>
    implements _$PlantDTOCopyWith<$Res> {
  __$PlantDTOCopyWithImpl(this._self, this._then);

  final _PlantDTO _self;
  final $Res Function(_PlantDTO) _then;

/// Create a copy of PlantDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? species = null,Object? careNotes = freezed,Object? userId = null,}) {
  return _then(_PlantDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
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
