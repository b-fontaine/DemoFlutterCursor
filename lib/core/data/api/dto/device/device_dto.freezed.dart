// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
DeviceDTO _$DeviceDTOFromJson(
  Map<String, dynamic> json
) {
    return DeviceDTOData.fromJson(
      json
    );
}

/// @nodoc
mixin _$DeviceDTO {

@JsonKey(includeIfNull: false) String? get id;@TimestampConverter() DateTime get creationDate;@TimestampConverter() DateTime get lastUpdateDate; String get installationId; String get token; OperatingSystem get operatingSystem;
/// Create a copy of DeviceDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceDTOCopyWith<DeviceDTO> get copyWith => _$DeviceDTOCopyWithImpl<DeviceDTO>(this as DeviceDTO, _$identity);

  /// Serializes this DeviceDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.installationId, installationId) || other.installationId == installationId)&&(identical(other.token, token) || other.token == token)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,installationId,token,operatingSystem);

@override
String toString() {
  return 'DeviceDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, installationId: $installationId, token: $token, operatingSystem: $operatingSystem)';
}


}

/// @nodoc
abstract mixin class $DeviceDTOCopyWith<$Res>  {
  factory $DeviceDTOCopyWith(DeviceDTO value, $Res Function(DeviceDTO) _then) = _$DeviceDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@TimestampConverter() DateTime creationDate,@TimestampConverter() DateTime lastUpdateDate, String installationId, String token, OperatingSystem operatingSystem
});




}
/// @nodoc
class _$DeviceDTOCopyWithImpl<$Res>
    implements $DeviceDTOCopyWith<$Res> {
  _$DeviceDTOCopyWithImpl(this._self, this._then);

  final DeviceDTO _self;
  final $Res Function(DeviceDTO) _then;

/// Create a copy of DeviceDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = null,Object? lastUpdateDate = null,Object? installationId = null,Object? token = null,Object? operatingSystem = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdateDate: null == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime,installationId: null == installationId ? _self.installationId : installationId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,operatingSystem: null == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as OperatingSystem,
  ));
}

}


/// @nodoc
@JsonSerializable()

class DeviceDTOData extends DeviceDTO {
  const DeviceDTOData({@JsonKey(includeIfNull: false) this.id, @TimestampConverter() required this.creationDate, @TimestampConverter() required this.lastUpdateDate, required this.installationId, required this.token, required this.operatingSystem}): super._();
  factory DeviceDTOData.fromJson(Map<String, dynamic> json) => _$DeviceDTODataFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override@TimestampConverter() final  DateTime creationDate;
@override@TimestampConverter() final  DateTime lastUpdateDate;
@override final  String installationId;
@override final  String token;
@override final  OperatingSystem operatingSystem;

/// Create a copy of DeviceDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceDTODataCopyWith<DeviceDTOData> get copyWith => _$DeviceDTODataCopyWithImpl<DeviceDTOData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceDTODataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceDTOData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.installationId, installationId) || other.installationId == installationId)&&(identical(other.token, token) || other.token == token)&&(identical(other.operatingSystem, operatingSystem) || other.operatingSystem == operatingSystem));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,installationId,token,operatingSystem);

@override
String toString() {
  return 'DeviceDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, installationId: $installationId, token: $token, operatingSystem: $operatingSystem)';
}


}

/// @nodoc
abstract mixin class $DeviceDTODataCopyWith<$Res> implements $DeviceDTOCopyWith<$Res> {
  factory $DeviceDTODataCopyWith(DeviceDTOData value, $Res Function(DeviceDTOData) _then) = _$DeviceDTODataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@TimestampConverter() DateTime creationDate,@TimestampConverter() DateTime lastUpdateDate, String installationId, String token, OperatingSystem operatingSystem
});




}
/// @nodoc
class _$DeviceDTODataCopyWithImpl<$Res>
    implements $DeviceDTODataCopyWith<$Res> {
  _$DeviceDTODataCopyWithImpl(this._self, this._then);

  final DeviceDTOData _self;
  final $Res Function(DeviceDTOData) _then;

/// Create a copy of DeviceDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = null,Object? lastUpdateDate = null,Object? installationId = null,Object? token = null,Object? operatingSystem = null,}) {
  return _then(DeviceDTOData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: null == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime,lastUpdateDate: null == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime,installationId: null == installationId ? _self.installationId : installationId // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,operatingSystem: null == operatingSystem ? _self.operatingSystem : operatingSystem // ignore: cast_nullable_to_non_nullable
as OperatingSystem,
  ));
}


}

// dart format on
