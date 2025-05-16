import 'package:demo_flutter_cursor/core/initializer/on_start_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Import des classes exemple (ici références simplifiées pour l'exemple)
// En réalité, ces classes seraient dans les dossiers appropriés du projet
import 'example.dart';
import 'example_state.dart';

/// Provider definition for Riverpod
final exampleStateNotifierProvider =
    StateNotifierProvider<ExampleStateNotifier, ExampleState>((ref) {
      return ExampleStateNotifier(getExampleUseCase: GetExampleUseCase());
    });

/// This class is responsible for managing the example state.
/// It demonstrates the standard structure for a StateNotifier in this application.
class ExampleStateNotifier extends StateNotifier<ExampleState> {
  final GetExampleUseCase _getExampleUseCase;

  /// Constructor with dependency injection
  ExampleStateNotifier({required GetExampleUseCase getExampleUseCase})
    : _getExampleUseCase = getExampleUseCase,
      super(ExampleState(example: Example(name: 'loading')));

  @override
  Future<void> init() async {
    await _loadState();
  }

  /// Refreshes the example data from the source
  Future<void> refresh() async {
    try {
      final example = await _getExampleUseCase();
      state = state.copyWith(example: example);
    } catch (e) {
      debugPrint('Error refreshing example: $e');
    }
  }

  /// Updates the example with new data
  Future<void> updateExample(String name, String? description) async {
    // Create a new Example based on current state but with updated fields
    final updatedExample = Example(
      id: state.example.id,
      name: name,
      description: description,
      creationDate: state.example.creationDate,
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
  Future<void> _loadState() async {
    try {
      final example = await _getExampleUseCase();
      state = state.copyWith(example: example);
    } catch (e) {
      debugPrint('Error loading example: $e');
      // Here you might want to handle error state
    }
  }
}
