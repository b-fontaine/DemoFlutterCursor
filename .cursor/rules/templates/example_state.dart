import 'package:freezed_annotation/freezed_annotation.dart';
import 'example.dart';

part 'example_state.freezed.dart';

/// A simplified example of a state class
@freezed
class ExampleState with _$ExampleState {
  const factory ExampleState({required Example example}) = _ExampleState;

  const ExampleState._();

  /// Check if the example is loading
  bool get isLoading => example.id == null;
}
