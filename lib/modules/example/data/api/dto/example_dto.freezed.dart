// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ExampleDTO _$ExampleDTOFromJson(
  Map<String, dynamic> json
) {
    return ExampleDTOData.fromJson(
      json
    );
}

/// @nodoc
mixin _$ExampleDTO {

@JsonKey(includeIfNull: false) String? get id;@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? get creationDate;@JsonKey(name: 'last_update_date')@TimestampConverter() DateTime? get lastUpdateDate; String get name; String? get description;
/// Create a copy of ExampleDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleDTOCopyWith<ExampleDTO> get copyWith => _$ExampleDTOCopyWithImpl<ExampleDTO>(this as ExampleDTO, _$identity);

  /// Serializes this ExampleDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,description);

@override
String toString() {
  return 'ExampleDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ExampleDTOCopyWith<$Res>  {
  factory $ExampleDTOCopyWith(ExampleDTO value, $Res Function(ExampleDTO) _then) = _$ExampleDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? creationDate,@JsonKey(name: 'last_update_date')@TimestampConverter() DateTime? lastUpdateDate, String name, String? description
});




}
/// @nodoc
class _$ExampleDTOCopyWithImpl<$Res>
    implements $ExampleDTOCopyWith<$Res> {
  _$ExampleDTOCopyWithImpl(this._self, this._then);

  final ExampleDTO _self;
  final $Res Function(ExampleDTO) _then;

/// Create a copy of ExampleDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class ExampleDTOData extends ExampleDTO {
  const ExampleDTOData({@JsonKey(includeIfNull: false) this.id, @JsonKey(name: 'creation_date')@TimestampConverter() this.creationDate, @JsonKey(name: 'last_update_date')@TimestampConverter() this.lastUpdateDate, required this.name, this.description}): super._();
  factory ExampleDTOData.fromJson(Map<String, dynamic> json) => _$ExampleDTODataFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override@JsonKey(name: 'creation_date')@TimestampConverter() final  DateTime? creationDate;
@override@JsonKey(name: 'last_update_date')@TimestampConverter() final  DateTime? lastUpdateDate;
@override final  String name;
@override final  String? description;

/// Create a copy of ExampleDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleDTODataCopyWith<ExampleDTOData> get copyWith => _$ExampleDTODataCopyWithImpl<ExampleDTOData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleDTODataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleDTOData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,description);

@override
String toString() {
  return 'ExampleDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ExampleDTODataCopyWith<$Res> implements $ExampleDTOCopyWith<$Res> {
  factory $ExampleDTODataCopyWith(ExampleDTOData value, $Res Function(ExampleDTOData) _then) = _$ExampleDTODataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? creationDate,@JsonKey(name: 'last_update_date')@TimestampConverter() DateTime? lastUpdateDate, String name, String? description
});




}
/// @nodoc
class _$ExampleDTODataCopyWithImpl<$Res>
    implements $ExampleDTODataCopyWith<$Res> {
  _$ExampleDTODataCopyWithImpl(this._self, this._then);

  final ExampleDTOData _self;
  final $Res Function(ExampleDTOData) _then;

/// Create a copy of ExampleDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? description = freezed,}) {
  return _then(ExampleDTOData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
