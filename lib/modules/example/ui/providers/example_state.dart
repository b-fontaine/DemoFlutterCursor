import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_state.freezed.dart';

@freezed
sealed class ExampleState with _$ExampleState {
  const factory ExampleState({required Example? example}) = _ExampleState;

  const ExampleState._();

  /// Check if the example is loading
  bool get isLoading => example == null;
}
