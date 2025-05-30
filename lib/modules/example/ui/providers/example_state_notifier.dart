import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/usecases/get_example_usecase.dart';
import 'package:demo_flutter_cursor/modules/example/ui/providers/example_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exampleStateNotifierProvider =
    StateNotifierProvider<ExampleStateNotifier, ExampleState>((ref) {
      return ExampleStateNotifier(
        getExampleUseCase: ref.read(getExampleUseCaseProvider),
      );
    });

class ExampleStateNotifier extends StateNotifier<ExampleState> {
  final GetExampleUseCase _getExampleUseCase;

  ExampleStateNotifier({required GetExampleUseCase getExampleUseCase})
    : _getExampleUseCase = getExampleUseCase,
      super(const ExampleState(example: null));

  Future<void> init(String id) async {
    await _loadState(id);
  }

  Future<void> refresh() async {
    if (state.example == null) {
      return;
    }
    await _loadState(state.example!.id);
  }

  Future<void> updateExample(String name, String? description) async {
    if (state.example == null) {
      return;
    }
    final updatedExample = Example(
      id: state.example!.id,
      name: name,
      description: description,
      creationDate: state.example!.creationDate,
      lastUpdateDate: DateTime.now(),
    );

    // Update state with new example (in real app would save to repository first)
    state = state.copyWith(example: updatedExample);
  }

  /// Example of action handler that would be called from UI
  Future<void> onAction() async {
    // Implementation would depend on specific use case
    await refresh();
  }

  // -------------------------------
  // PRIVATES
  // -------------------------------

  /// Loads the initial state
  Future<void> _loadState(String id) async {
    try {
      final example = await _getExampleUseCase(id);
      state = state.copyWith(example: example);
    } catch (e) {
      debugPrint('Error loading example: $e');
      // Here you might want to handle error state
    }
  }
}
