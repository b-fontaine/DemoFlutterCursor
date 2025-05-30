// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'example_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExampleState {

 Example? get example;
/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExampleStateCopyWith<ExampleState> get copyWith => _$ExampleStateCopyWithImpl<ExampleState>(this as ExampleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExampleState&&(identical(other.example, example) || other.example == example));
}


@override
int get hashCode => Object.hash(runtimeType,example);

@override
String toString() {
  return 'ExampleState(example: $example)';
}


}

/// @nodoc
abstract mixin class $ExampleStateCopyWith<$Res>  {
  factory $ExampleStateCopyWith(ExampleState value, $Res Function(ExampleState) _then) = _$ExampleStateCopyWithImpl;
@useResult
$Res call({
 Example? example
});


$ExampleCopyWith<$Res>? get example;

}
/// @nodoc
class _$ExampleStateCopyWithImpl<$Res>
    implements $ExampleStateCopyWith<$Res> {
  _$ExampleStateCopyWithImpl(this._self, this._then);

  final ExampleState _self;
  final $Res Function(ExampleState) _then;

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? example = freezed,}) {
  return _then(_self.copyWith(
example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as Example?,
  ));
}
/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleCopyWith<$Res>? get example {
    if (_self.example == null) {
    return null;
  }

  return $ExampleCopyWith<$Res>(_self.example!, (value) {
    return _then(_self.copyWith(example: value));
  });
}
}


/// @nodoc


class _ExampleState extends ExampleState {
  const _ExampleState({required this.example}): super._();
  

@override final  Example? example;

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExampleStateCopyWith<_ExampleState> get copyWith => __$ExampleStateCopyWithImpl<_ExampleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExampleState&&(identical(other.example, example) || other.example == example));
}


@override
int get hashCode => Object.hash(runtimeType,example);

@override
String toString() {
  return 'ExampleState(example: $example)';
}


}

/// @nodoc
abstract mixin class _$ExampleStateCopyWith<$Res> implements $ExampleStateCopyWith<$Res> {
  factory _$ExampleStateCopyWith(_ExampleState value, $Res Function(_ExampleState) _then) = __$ExampleStateCopyWithImpl;
@override @useResult
$Res call({
 Example? example
});


@override $ExampleCopyWith<$Res>? get example;

}
/// @nodoc
class __$ExampleStateCopyWithImpl<$Res>
    implements _$ExampleStateCopyWith<$Res> {
  __$ExampleStateCopyWithImpl(this._self, this._then);

  final _ExampleState _self;
  final $Res Function(_ExampleState) _then;

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? example = freezed,}) {
  return _then(_ExampleState(
example: freezed == example ? _self.example : example // ignore: cast_nullable_to_non_nullable
as Example?,
  ));
}

/// Create a copy of ExampleState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ExampleCopyWith<$Res>? get example {
    if (_self.example == null) {
    return null;
  }

  return $ExampleCopyWith<$Res>(_self.example!, (value) {
    return _then(_self.copyWith(example: value));
  });
}
}

// dart format on
