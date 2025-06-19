// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plant_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlantState {

 List<Plant> get plants; bool get isLoading; String? get error;
/// Create a copy of PlantState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantStateCopyWith<PlantState> get copyWith => _$PlantStateCopyWithImpl<PlantState>(this as PlantState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantState&&const DeepCollectionEquality().equals(other.plants, plants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(plants),isLoading,error);

@override
String toString() {
  return 'PlantState(plants: $plants, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $PlantStateCopyWith<$Res>  {
  factory $PlantStateCopyWith(PlantState value, $Res Function(PlantState) _then) = _$PlantStateCopyWithImpl;
@useResult
$Res call({
 List<Plant> plants, bool isLoading, String? error
});




}
/// @nodoc
class _$PlantStateCopyWithImpl<$Res>
    implements $PlantStateCopyWith<$Res> {
  _$PlantStateCopyWithImpl(this._self, this._then);

  final PlantState _self;
  final $Res Function(PlantState) _then;

/// Create a copy of PlantState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plants = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
plants: null == plants ? _self.plants : plants // ignore: cast_nullable_to_non_nullable
as List<Plant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _PlantState extends PlantState {
  const _PlantState({final  List<Plant> plants = const [], this.isLoading = false, this.error}): _plants = plants,super._();
  

 final  List<Plant> _plants;
@override@JsonKey() List<Plant> get plants {
  if (_plants is EqualUnmodifiableListView) return _plants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plants);
}

@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of PlantState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantStateCopyWith<_PlantState> get copyWith => __$PlantStateCopyWithImpl<_PlantState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantState&&const DeepCollectionEquality().equals(other._plants, _plants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_plants),isLoading,error);

@override
String toString() {
  return 'PlantState(plants: $plants, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$PlantStateCopyWith<$Res> implements $PlantStateCopyWith<$Res> {
  factory _$PlantStateCopyWith(_PlantState value, $Res Function(_PlantState) _then) = __$PlantStateCopyWithImpl;
@override @useResult
$Res call({
 List<Plant> plants, bool isLoading, String? error
});




}
/// @nodoc
class __$PlantStateCopyWithImpl<$Res>
    implements _$PlantStateCopyWith<$Res> {
  __$PlantStateCopyWithImpl(this._self, this._then);

  final _PlantState _self;
  final $Res Function(_PlantState) _then;

/// Create a copy of PlantState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plants = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_PlantState(
plants: null == plants ? _self._plants : plants // ignore: cast_nullable_to_non_nullable
as List<Plant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
