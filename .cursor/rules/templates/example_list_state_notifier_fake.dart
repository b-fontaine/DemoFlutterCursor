import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/ui/state/example_list_state.dart';
import 'package:demo_flutter_cursor/modules/example/ui/state/example_list_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleListStateNotifierFake extends StateNotifier<ExampleListState>
    implements ExampleListStateNotifier {
  ExampleListStateNotifierFake() : super(ExampleListState.initial());

  // For controlling test scenarios
  bool simulateError = false;
  Exception errorToThrow = Exception('Fake state notifier error');

  // Track method calls for verification
  int getExamplesCallCount = 0;
  int createExampleCallCount = 0;
  List<String> createdExampleNames = [];

  @override
  Future<void> getExamples() async {
    getExamplesCallCount++;

    if (simulateError) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: errorToThrow.toString(),
      );
      throw errorToThrow;
    }

    state = state.copyWith(isLoading: true);

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 10));

    // Return to the existing state but with isLoading=false
    state = state.copyWith(isLoading: false);
  }

  @override
  Future<void> createExample(String name) async {
    createExampleCallCount++;
    createdExampleNames.add(name);

    if (simulateError) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: errorToThrow.toString(),
      );
      throw errorToThrow;
    }

    state = state.copyWith(isLoading: true);

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 10));

    final newExample = Example(id: '${state.examples.length + 1}', name: name);

    state = state.copyWith(
      examples: [...state.examples, newExample],
      isLoading: false,
    );
  }

  // Helper methods for testing
  void setExamples(List<Example> examples) {
    state = state.copyWith(examples: examples);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void setError(String? errorMessage) {
    state = state.copyWith(errorMessage: errorMessage);
  }
}
