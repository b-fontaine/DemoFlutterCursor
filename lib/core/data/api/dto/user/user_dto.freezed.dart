// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
UserDTO _$UserDTOFromJson(
  Map<String, dynamic> json
) {
    return UserDTOData.fromJson(
      json
    );
}

/// @nodoc
mixin _$UserDTO {

@JsonKey(includeIfNull: false, toJson: Converters.id) String? get id;@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? get creationDate;@JsonKey(name: 'last_update_date')@TimestampConverter() DateTime? get lastUpdateDate; String? get name; String? get email; String? get avatarPath; bool? get onboarded;
/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDTOCopyWith<UserDTO> get copyWith => _$UserDTOCopyWithImpl<UserDTO>(this as UserDTO, _$identity);

  /// Serializes this UserDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.onboarded, onboarded) || other.onboarded == onboarded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,email,avatarPath,onboarded);

@override
String toString() {
  return 'UserDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, email: $email, avatarPath: $avatarPath, onboarded: $onboarded)';
}


}

/// @nodoc
abstract mixin class $UserDTOCopyWith<$Res>  {
  factory $UserDTOCopyWith(UserDTO value, $Res Function(UserDTO) _then) = _$UserDTOCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? creationDate,@JsonKey(name: 'last_update_date')@TimestampConverter() DateTime? lastUpdateDate, String? name, String? email, String? avatarPath, bool? onboarded
});




}
/// @nodoc
class _$UserDTOCopyWithImpl<$Res>
    implements $UserDTOCopyWith<$Res> {
  _$UserDTOCopyWithImpl(this._self, this._then);

  final UserDTO _self;
  final $Res Function(UserDTO) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = freezed,Object? email = freezed,Object? avatarPath = freezed,Object? onboarded = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,onboarded: freezed == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class UserDTOData extends UserDTO {
  const UserDTOData({@JsonKey(includeIfNull: false, toJson: Converters.id) this.id, @JsonKey(name: 'creation_date')@TimestampConverter() this.creationDate, @JsonKey(name: 'last_update_date')@TimestampConverter() this.lastUpdateDate, this.name, this.email, this.avatarPath, this.onboarded}): super._();
  factory UserDTOData.fromJson(Map<String, dynamic> json) => _$UserDTODataFromJson(json);

@override@JsonKey(includeIfNull: false, toJson: Converters.id) final  String? id;
@override@JsonKey(name: 'creation_date')@TimestampConverter() final  DateTime? creationDate;
@override@JsonKey(name: 'last_update_date')@TimestampConverter() final  DateTime? lastUpdateDate;
@override final  String? name;
@override final  String? email;
@override final  String? avatarPath;
@override final  bool? onboarded;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDTODataCopyWith<UserDTOData> get copyWith => _$UserDTODataCopyWithImpl<UserDTOData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDTODataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDTOData&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.onboarded, onboarded) || other.onboarded == onboarded));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,email,avatarPath,onboarded);

@override
String toString() {
  return 'UserDTO(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, email: $email, avatarPath: $avatarPath, onboarded: $onboarded)';
}


}

/// @nodoc
abstract mixin class $UserDTODataCopyWith<$Res> implements $UserDTOCopyWith<$Res> {
  factory $UserDTODataCopyWith(UserDTOData value, $Res Function(UserDTOData) _then) = _$UserDTODataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false, toJson: Converters.id) String? id,@JsonKey(name: 'creation_date')@TimestampConverter() DateTime? creationDate,@JsonKey(name: 'last_update_date')@TimestampConverter() DateTime? lastUpdateDate, String? name, String? email, String? avatarPath, bool? onboarded
});




}
/// @nodoc
class _$UserDTODataCopyWithImpl<$Res>
    implements $UserDTODataCopyWith<$Res> {
  _$UserDTODataCopyWithImpl(this._self, this._then);

  final UserDTOData _self;
  final $Res Function(UserDTOData) _then;

/// Create a copy of UserDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = freezed,Object? email = freezed,Object? avatarPath = freezed,Object? onboarded = freezed,}) {
  return _then(UserDTOData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,onboarded: freezed == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
