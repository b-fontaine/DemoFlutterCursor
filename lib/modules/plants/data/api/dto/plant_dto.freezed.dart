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
mixin _$PlantDto {

 String get id; DateTime? get creationDate; DateTime? get lastUpdateDate; String get name; String get type; String? get description;
/// Create a copy of PlantDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantDtoCopyWith<PlantDto> get copyWith => _$PlantDtoCopyWithImpl<PlantDto>(this as PlantDto, _$identity);

  /// Serializes this PlantDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,type,description);

@override
String toString() {
  return 'PlantDto(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class $PlantDtoCopyWith<$Res>  {
  factory $PlantDtoCopyWith(PlantDto value, $Res Function(PlantDto) _then) = _$PlantDtoCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String type, String? description
});




}
/// @nodoc
class _$PlantDtoCopyWithImpl<$Res>
    implements $PlantDtoCopyWith<$Res> {
  _$PlantDtoCopyWithImpl(this._self, this._then);

  final PlantDto _self;
  final $Res Function(PlantDto) _then;

/// Create a copy of PlantDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? type = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PlantDto extends PlantDto {
  const _PlantDto({required this.id, this.creationDate, this.lastUpdateDate, required this.name, required this.type, this.description}): super._();
  factory _PlantDto.fromJson(Map<String, dynamic> json) => _$PlantDtoFromJson(json);

@override final  String id;
@override final  DateTime? creationDate;
@override final  DateTime? lastUpdateDate;
@override final  String name;
@override final  String type;
@override final  String? description;

/// Create a copy of PlantDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantDtoCopyWith<_PlantDto> get copyWith => __$PlantDtoCopyWithImpl<_PlantDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlantDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantDto&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,type,description);

@override
String toString() {
  return 'PlantDto(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, type: $type, description: $description)';
}


}

/// @nodoc
abstract mixin class _$PlantDtoCopyWith<$Res> implements $PlantDtoCopyWith<$Res> {
  factory _$PlantDtoCopyWith(_PlantDto value, $Res Function(_PlantDto) _then) = __$PlantDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String type, String? description
});




}
/// @nodoc
class __$PlantDtoCopyWithImpl<$Res>
    implements _$PlantDtoCopyWith<$Res> {
  __$PlantDtoCopyWithImpl(this._self, this._then);

  final _PlantDto _self;
  final $Res Function(_PlantDto) _then;

/// Create a copy of PlantDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? type = null,Object? description = freezed,}) {
  return _then(_PlantDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
