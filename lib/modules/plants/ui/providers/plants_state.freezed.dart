// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plants_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlantsState {

 List<Plant> get plants; bool get isLoading; bool get hasError; String? get errorMessage;
/// Create a copy of PlantsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlantsStateCopyWith<PlantsState> get copyWith => _$PlantsStateCopyWithImpl<PlantsState>(this as PlantsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlantsState&&const DeepCollectionEquality().equals(other.plants, plants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(plants),isLoading,hasError,errorMessage);

@override
String toString() {
  return 'PlantsState(plants: $plants, isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $PlantsStateCopyWith<$Res>  {
  factory $PlantsStateCopyWith(PlantsState value, $Res Function(PlantsState) _then) = _$PlantsStateCopyWithImpl;
@useResult
$Res call({
 List<Plant> plants, bool isLoading, bool hasError, String? errorMessage
});




}
/// @nodoc
class _$PlantsStateCopyWithImpl<$Res>
    implements $PlantsStateCopyWith<$Res> {
  _$PlantsStateCopyWithImpl(this._self, this._then);

  final PlantsState _self;
  final $Res Function(PlantsState) _then;

/// Create a copy of PlantsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plants = null,Object? isLoading = null,Object? hasError = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
plants: null == plants ? _self.plants : plants // ignore: cast_nullable_to_non_nullable
as List<Plant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _PlantsState extends PlantsState {
  const _PlantsState({final  List<Plant> plants = const [], this.isLoading = false, this.hasError = false, this.errorMessage}): _plants = plants,super._();
  

 final  List<Plant> _plants;
@override@JsonKey() List<Plant> get plants {
  if (_plants is EqualUnmodifiableListView) return _plants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plants);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool hasError;
@override final  String? errorMessage;

/// Create a copy of PlantsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlantsStateCopyWith<_PlantsState> get copyWith => __$PlantsStateCopyWithImpl<_PlantsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlantsState&&const DeepCollectionEquality().equals(other._plants, _plants)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.hasError, hasError) || other.hasError == hasError)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_plants),isLoading,hasError,errorMessage);

@override
String toString() {
  return 'PlantsState(plants: $plants, isLoading: $isLoading, hasError: $hasError, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$PlantsStateCopyWith<$Res> implements $PlantsStateCopyWith<$Res> {
  factory _$PlantsStateCopyWith(_PlantsState value, $Res Function(_PlantsState) _then) = __$PlantsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Plant> plants, bool isLoading, bool hasError, String? errorMessage
});




}
/// @nodoc
class __$PlantsStateCopyWithImpl<$Res>
    implements _$PlantsStateCopyWith<$Res> {
  __$PlantsStateCopyWithImpl(this._self, this._then);

  final _PlantsState _self;
  final $Res Function(_PlantsState) _then;

/// Create a copy of PlantsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plants = null,Object? isLoading = null,Object? hasError = null,Object? errorMessage = freezed,}) {
  return _then(_PlantsState(
plants: null == plants ? _self._plants : plants // ignore: cast_nullable_to_non_nullable
as List<Plant>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,hasError: null == hasError ? _self.hasError : hasError // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
