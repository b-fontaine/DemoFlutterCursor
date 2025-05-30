// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExampleEntity {

@JsonKey(includeIfNull: false) String get id;@JsonKey(name: 'creation_date') DateTime? get creationDate;@JsonKey(name: 'last_update_date') DateTime? get lastUpdateDate; String get name; String? get description;
/// Create a copy of ExampleEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleEntityCopyWith<ExampleEntity> get copyWith => _$ExampleEntityCopyWithImpl<ExampleEntity>(this as ExampleEntity, _$identity);

  /// Serializes this ExampleEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,description);

@override
String toString() {
  return 'ExampleEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ExampleEntityCopyWith<$Res>  {
  factory $ExampleEntityCopyWith(ExampleEntity value, $Res Function(ExampleEntity) _then) = _$ExampleEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String id,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate, String name, String? description
});




}
/// @nodoc
class _$ExampleEntityCopyWithImpl<$Res>
    implements $ExampleEntityCopyWith<$Res> {
  _$ExampleEntityCopyWithImpl(this._self, this._then);

  final ExampleEntity _self;
  final $Res Function(ExampleEntity) _then;

/// Create a copy of ExampleEntity
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
@JsonSerializable()

class _ExampleEntity extends ExampleEntity {
  const _ExampleEntity({@JsonKey(includeIfNull: false) required this.id, @JsonKey(name: 'creation_date') this.creationDate, @JsonKey(name: 'last_update_date') this.lastUpdateDate, required this.name, this.description}): super._();
  factory _ExampleEntity.fromJson(Map<String, dynamic> json) => _$ExampleEntityFromJson(json);

@override@JsonKey(includeIfNull: false) final  String id;
@override@JsonKey(name: 'creation_date') final  DateTime? creationDate;
@override@JsonKey(name: 'last_update_date') final  DateTime? lastUpdateDate;
@override final  String name;
@override final  String? description;

/// Create a copy of ExampleEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleEntityCopyWith<_ExampleEntity> get copyWith => __$ExampleEntityCopyWithImpl<_ExampleEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExampleEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.creationDate, creationDate) || other.creationDate == creationDate)&&(identical(other.lastUpdateDate, lastUpdateDate) || other.lastUpdateDate == lastUpdateDate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,creationDate,lastUpdateDate,name,description);

@override
String toString() {
  return 'ExampleEntity(id: $id, creationDate: $creationDate, lastUpdateDate: $lastUpdateDate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ExampleEntityCopyWith<$Res> implements $ExampleEntityCopyWith<$Res> {
  factory _$ExampleEntityCopyWith(_ExampleEntity value, $Res Function(_ExampleEntity) _then) = __$ExampleEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String id,@JsonKey(name: 'creation_date') DateTime? creationDate,@JsonKey(name: 'last_update_date') DateTime? lastUpdateDate, String name, String? description
});




}
/// @nodoc
class __$ExampleEntityCopyWithImpl<$Res>
    implements _$ExampleEntityCopyWith<$Res> {
  __$ExampleEntityCopyWithImpl(this._self, this._then);

  final _ExampleEntity _self;
  final $Res Function(_ExampleEntity) _then;

/// Create a copy of ExampleEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creationDate = freezed,Object? lastUpdateDate = freezed,Object? name = null,Object? description = freezed,}) {
  return _then(_ExampleEntity(
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
