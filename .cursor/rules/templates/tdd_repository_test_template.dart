// TDD Test Template for Repository Layer
// Created BEFORE implementation as part of RED phase

import 'package:demo_flutter_cursor/modules/example/data/api/dto/example_dto.dart';
import 'package:demo_flutter_cursor/modules/example/data/repositories/example_repository_impl.dart';
import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/example_repository.dart';
import 'package:flutter_test/flutter_test.dart';

// Import fakes
import '../../data/api/example_api_fake.dart';

void main() {
  late ExampleRepository repository;
  late ExampleApiFake fakeApi;

  setUp(() {
    fakeApi = ExampleApiFake();
    repository = ExampleRepositoryImpl(exampleApi: fakeApi);
  });

  group('getExamples', () {
    // Test: Happy path - should return examples when API call succeeds
    test('when API returns data, then returns list of domain models', () async {
      // Given
      final exampleDtos = [
        ExampleDTO(id: '1', name: 'Example 1'),
        ExampleDTO(id: '2', name: 'Example 2'),
      ];
      fakeApi.addFakeExamples(exampleDtos);

      // When
      final result = await repository.getExamples();

      // Then
      expect(result.length, 2);
      expect(result[0].id, '1');
      expect(result[0].name, 'Example 1');
      expect(result[1].id, '2');
      expect(result[1].name, 'Example 2');
    });

    // Test: Error case - should throw exception when API call fails
    test('when API throws error, then throws repository exception', () async {
      // Given
      fakeApi.simulateError = true;
      fakeApi.errorToThrow = Exception('API Error');

      // When
      final future = repository.getExamples();

      // Then
      expect(future, throwsA(isA<Exception>()));
    });
  });

  group('createExample', () {
    // Test: Happy path - should create example when API call succeeds
    test('when API successfully creates, then returns domain model', () async {
      // Given
      final example = Example(id: '', name: 'New Example');

      // When
      final result = await repository.createExample(example);

      // Then
      expect(result.id, '1'); // First example gets ID '1'
      expect(result.name, 'New Example');

      // Verify the example was added to the API's storage
      final allExamples = await fakeApi.getExamples();
      expect(allExamples.length, 1);
      expect(allExamples[0].id, '1');
      expect(allExamples[0].name, 'New Example');
    });

    // Test: Error case - should throw exception when API call fails
    test(
      'when API throws error on create, then throws repository exception',
      () async {
        // Given
        final example = Example(id: '', name: 'Example');
        fakeApi.simulateError = true;
        fakeApi.errorToThrow = Exception('API Error');

        // When
        final future = repository.createExample(example);

        // Then
        expect(future, throwsA(isA<Exception>()));
      },
    );
  });
}
