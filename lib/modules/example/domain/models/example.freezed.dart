// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Example {

 String get id; DateTime? get creationDate; DateTime? get lastUpdateDate; String get name; String? get description;
/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleCopyWith<Example> get copyWith => _$ExampleCopyWithImpl<Example>(this as Example, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Example&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,description);

@override
String toString() {
  return 'Example(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ExampleCopyWith<$Res>  {
  factory $ExampleCopyWith(Example value, $Res Function(Example) _then) = _$ExampleCopyWithImpl;
@useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String? description
});




}
/// @nodoc
class _$ExampleCopyWithImpl<$Res>
    implements $ExampleCopyWith<$Res> {
  _$ExampleCopyWithImpl(this._self, this._then);

  final Example _self;
  final $Res Function(Example) _then;

/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _Example extends Example {
  const _Example({required this.id, this.creationDate, this.lastUpdateDate, required this.name, this.description}): super._();
  

@override final  String id;
@override final  DateTime? creationDate;
@override final  DateTime? lastUpdateDate;
@override final  String name;
@override final  String? description;

/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleCopyWith<_Example> get copyWith => __$ExampleCopyWithImpl<_Example>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Example&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,description);

@override
String toString() {
  return 'Example(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ExampleCopyWith<$Res> implements $ExampleCopyWith<$Res> {
  factory _$ExampleCopyWith(_Example value, $Res Function(_Example) _then) = __$ExampleCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime? creationDate, DateTime? lastUpdateDate, String name, String? description
});




}
/// @nodoc
class __$ExampleCopyWithImpl<$Res>
    implements _$ExampleCopyWith<$Res> {
  __$ExampleCopyWithImpl(this._self, this._then);

  final _Example _self;
  final $Res Function(_Example) _then;

/// Create a copy of Example
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? description = freezed,}) {
  return _then(_Example(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,creationDate: freezed == creationDate ? _self.creationDate : creationDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastUpdateDate: freezed == lastUpdateDate ? _self.lastUpdateDate : lastUpdateDate // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
