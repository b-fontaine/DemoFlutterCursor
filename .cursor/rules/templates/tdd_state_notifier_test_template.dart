// TDD Test Template for State Notifier Layer
// Created BEFORE implementation as part of RED phase

import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/ui/state/example_list_state.dart';
import 'package:demo_flutter_cursor/modules/example/ui/state/example_list_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';

// Import fakes
import '../../domain/usecases/get_examples_usecase_fake.dart';
import '../../domain/usecases/create_example_usecase_fake.dart';

void main() {
  late ExampleListStateNotifier stateNotifier;
  late GetExamplesUseCaseFake fakeGetExamplesUseCase;
  late CreateExampleUseCaseFake fakeCreateExampleUseCase;

  setUp(() {
    fakeGetExamplesUseCase = GetExamplesUseCaseFake();
    fakeCreateExampleUseCase = CreateExampleUseCaseFake();
    stateNotifier = ExampleListStateNotifier(
      getExamplesUseCase: fakeGetExamplesUseCase,
      createExampleUseCase: fakeCreateExampleUseCase,
    );
  });

  test('initial state is correct', () {
    // Given initial state

    // When - notifier is created in setUp

    // Then
    expect(stateNotifier.state.examples, isEmpty);
    expect(stateNotifier.state.isLoading, false);
    expect(stateNotifier.state.errorMessage, isNull);
  });

  group('getExamples', () {
    // Test: Happy path - should update state with examples when use case succeeds
    test(
      'when use case returns data, then updates state with examples',
      () async {
        // Given
        final examples = [
          Example(id: '1', name: 'Example 1'),
          Example(id: '2', name: 'Example 2'),
        ];
        fakeGetExamplesUseCase.addFakeExamples(examples);

        // When
        await stateNotifier.getExamples();

        // Then
        expect(stateNotifier.state.isLoading, false);
        expect(stateNotifier.state.examples, examples);
        expect(stateNotifier.state.errorMessage, isNull);
      },
    );

    // Test: Loading state - should show loading while fetching
    test('when fetching data, then sets isLoading to true', () async {
      // Given
      final examples = [Example(id: '1', name: 'Example 1')];
      fakeGetExamplesUseCase.addFakeExamples(examples);

      // Add a delay to the fake use case to simulate network request
      // This is to ensure we can check loading state
      await Future.delayed(const Duration(milliseconds: 10));

      // When - start the operation but don't await it yet
      final future = stateNotifier.getExamples();

      // Then - check loading state is true before operation completes
      expect(stateNotifier.state.isLoading, true);

      // Complete the operation
      await future;
    });

    // Test: Error case - should update state with error when use case fails
    test(
      'when use case throws error, then updates state with error message',
      () async {
        // Given
        fakeGetExamplesUseCase.simulateError = true;
        fakeGetExamplesUseCase.errorToThrow = Exception('Use case error');

        // When
        await stateNotifier.getExamples();

        // Then
        expect(stateNotifier.state.isLoading, false);
        expect(stateNotifier.state.errorMessage, isNotNull);
        expect(stateNotifier.state.examples, isEmpty);
      },
    );
  });

  group('createExample', () {
    // Test: Happy path - should add example to state when use case succeeds
    test('when use case creates example, then adds it to state', () async {
      // Given
      final newExample = Example(id: '3', name: 'New Example');
      fakeCreateExampleUseCase.exampleToReturn = newExample;

      // Initial examples in state
      final initialExamples = [Example(id: '1', name: 'Example 1')];
      stateNotifier.state = stateNotifier.state.copyWith(
        examples: initialExamples,
      );

      // When
      await stateNotifier.createExample('New Example');

      // Then
      expect(stateNotifier.state.isLoading, false);
      expect(stateNotifier.state.examples.length, 2);
      expect(stateNotifier.state.examples.last.id, '3');
      expect(stateNotifier.state.examples.last.name, 'New Example');
      expect(stateNotifier.state.errorMessage, isNull);
    });

    // Test: Error case - should update state with error when use case fails
    test(
      'when use case throws error, then updates state with error message',
      () async {
        // Given
        fakeCreateExampleUseCase.simulateError = true;
        fakeCreateExampleUseCase.errorToThrow = Exception('Use case error');

        // When
        await stateNotifier.createExample('New Example');

        // Then
        expect(stateNotifier.state.isLoading, false);
        expect(stateNotifier.state.errorMessage, isNotNull);
        expect(stateNotifier.state.examples, isEmpty);
      },
    );
  });
}
