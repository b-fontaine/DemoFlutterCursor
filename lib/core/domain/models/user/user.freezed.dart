// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$User {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'User()';
}


}

/// @nodoc
class $UserCopyWith<$Res>  {
$UserCopyWith(User _, $Res Function(User) __);
}


/// @nodoc


class AuthenticatedUserData extends User {
  const AuthenticatedUserData({required this.email, this.name, this.id, this.creationDate, this.lastUpdateDate, this.avatarPath, required this.onboarded}): super._();
  

 final  String email;
 final  String? name;
 final  String? id;
 final  DateTime? creationDate;
 final  DateTime? lastUpdateDate;
 final  String? avatarPath;
 final  bool onboarded;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedUserDataCopyWith<AuthenticatedUserData> get copyWith => _$AuthenticatedUserDataCopyWithImpl<AuthenticatedUserData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedUserData&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.avatarPath, avatarPath) || other.avatarPath == avatarPath)&&(identical(other.onboarded, onboarded) || other.onboarded == onboarded));
}


@override
int get hashCode => Object.hash(runtimeType,email,name,id,creationDate,lastUpdateDate,avatarPath,onboarded);

@override
String toString() {
  return 'User.authenticated(email: $email, name: $name, id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, avatarPath: $avatarPath, onboarded: $onboarded)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedUserDataCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $AuthenticatedUserDataCopyWith(AuthenticatedUserData value, $Res Function(AuthenticatedUserData) _then) = _$AuthenticatedUserDataCopyWithImpl;
@useResult
$Res call({
 String email, String? name, String? id, DateTime? creationDate, DateTime? lastUpdateDate, String? avatarPath, bool onboarded
});




}
/// @nodoc
class _$AuthenticatedUserDataCopyWithImpl<$Res>
    implements $AuthenticatedUserDataCopyWith<$Res> {
  _$AuthenticatedUserDataCopyWithImpl(this._self, this._then);

  final AuthenticatedUserData _self;
  final $Res Function(AuthenticatedUserData) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? name = freezed,Object? id = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? avatarPath = freezed,Object? onboarded = null,}) {
  return _then(AuthenticatedUserData(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,avatarPath: freezed == avatarPath ? _self.avatarPath : avatarPath // ignore: cast_nullable_to_non_nullable
as String?,onboarded: null == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class AnonymousUserData extends User {
  const AnonymousUserData({this.id, this.onboarded, this.creationDate, this.lastUpdateDate}): super._();
  

 final  String? id;
 final  bool? onboarded;
 final  DateTime? creationDate;
 final  DateTime? lastUpdateDate;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnonymousUserDataCopyWith<AnonymousUserData> get copyWith => _$AnonymousUserDataCopyWithImpl<AnonymousUserData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AnonymousUserData&&(identical(other.id, id) || other.id == id)&&(identical(other.onboarded, onboarded) || other.onboarded == onboarded)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate));
}


@override
int get hashCode => Object.hash(runtimeType,id,onboarded,creationDate,lastUpdateDate);

@override
String toString() {
  return 'User.anonymous(id: $id, onboarded: $onboarded, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate)';
}


}

/// @nodoc
abstract mixin class $AnonymousUserDataCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory $AnonymousUserDataCopyWith(AnonymousUserData value, $Res Function(AnonymousUserData) _then) = _$AnonymousUserDataCopyWithImpl;
@useResult
$Res call({
 String? id, bool? onboarded, DateTime? creationDate, DateTime? lastUpdateDate
});




}
/// @nodoc
class _$AnonymousUserDataCopyWithImpl<$Res>
    implements $AnonymousUserDataCopyWith<$Res> {
  _$AnonymousUserDataCopyWithImpl(this._self, this._then);

  final AnonymousUserData _self;
  final $Res Function(AnonymousUserData) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? onboarded = freezed,Object? creationDate = freezed,Object? lastUpdateDate = freezed,}) {
  return _then(AnonymousUserData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,onboarded: freezed == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool?,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class LoadingUserData extends User {
  const LoadingUserData(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadingUserData);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'User.loading()';
}


}




// dart format on
