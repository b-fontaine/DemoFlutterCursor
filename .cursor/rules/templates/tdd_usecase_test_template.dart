// TDD Test Template for Use Case Layer
// Created BEFORE implementation as part of RED phase

import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/example_repository.dart';
import 'package:demo_flutter_cursor/modules/example/domain/usecases/get_examples_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

// Import fakes
import '../repositories/example_repository_fake.dart';

void main() {
  late GetExamplesUseCase useCase;
  late ExampleRepositoryFake fakeRepository;

  setUp(() {
    fakeRepository = ExampleRepositoryFake();
    useCase = GetExamplesUseCase(repository: fakeRepository);
  });

  group('call', () {
    // Test: Happy path - should return examples when repository call succeeds
    test(
      'when repository returns data, then returns list of examples',
      () async {
        // Given
        final examples = [
          Example(id: '1', name: 'Example 1'),
          Example(id: '2', name: 'Example 2'),
        ];
        fakeRepository.addFakeExamples(examples);

        // When
        final result = await useCase();

        // Then
        expect(result.length, 2);
        expect(result[0].id, '1');
        expect(result[0].name, 'Example 1');
        expect(result[1].id, '2');
        expect(result[1].name, 'Example 2');
      },
    );

    // Test: Error case - should propagate exception from repository
    test('when repository throws error, then propagates exception', () async {
      // Given
      fakeRepository.simulateError = true;
      fakeRepository.errorToThrow = Exception('Repository error');

      // When
      final future = useCase();

      // Then
      expect(future, throwsA(isA<Exception>()));
    });

    // Test: Filtering behavior (if applicable)
    test(
      'when providing filter criteria, then returns filtered examples',
      () async {
        // Given
        final examples = [
          Example(id: '1', name: 'Example 1', isActive: true),
          Example(id: '2', name: 'Example 2', isActive: false),
        ];
        fakeRepository.addFakeExamples(examples);

        // When
        final result = await useCase(onlyActive: true);

        // Then
        expect(result.length, 1);
        expect(result[0].id, '1');
        expect(result[0].name, 'Example 1');
        expect(result[0].isActive, true);
      },
    );
  });
}
