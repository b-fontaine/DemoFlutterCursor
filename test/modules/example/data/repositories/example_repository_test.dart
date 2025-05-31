import 'package:demo_flutter_cursor/modules/example/data/api/dto/example_dto.dart';
import 'package:demo_flutter_cursor/modules/example/data/repositories/example_repository.dart';
import 'package:demo_flutter_cursor/modules/example/data/storage/entity/example_entity.dart';
import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/exemple_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_example_api.dart';
import '../fakes/fake_example_dao.dart';

void main() {
  late ExampleRepository repository;
  late FakeExampleApi fakeApi;
  late FakeExampleDao fakeDao;

  setUp(() {
    fakeApi = FakeExampleApi();
    fakeDao = FakeExampleDao();
    repository = ExampleRepositoryImpl(api: fakeApi, dao: fakeDao);
  });

  group('ExampleRepository.get', () {
    test('should return example from local storage when available', () async {
      // Arrange
      const String exampleId = '1';
      const ExampleEntity entityInDao = ExampleEntity(
        id: exampleId,
        name: 'Example from DAO',
      );
      fakeDao.addExample(exampleId, entityInDao);

      // Act
      final Example? result = await repository.get(exampleId);

      // Assert
      expect(result, isNotNull);
      expect(result!.id, equals(exampleId));
      expect(result.name, equals('Example from DAO'));
      expect(fakeDao.getSavedEntities(), isEmpty);
    });

    test(
      'should fetch from API and save to local storage when not available locally',
      () async {
        // Arrange
        const String exampleId = '2';
        const ExampleDTO dtoInApi = ExampleDTOData(
          id: exampleId,
          name: 'Example from API',
        );
        fakeApi.addExample(exampleId, dtoInApi);

        // Act
        final Example? result = await repository.get(exampleId);

        // Assert
        expect(result, isNotNull);
        expect(result!.id, equals(exampleId));
        expect(result.name, equals('Example from API'));
        expect(fakeDao.getSavedEntities(), hasLength(1));
        expect(fakeDao.getSavedEntities().first.id, equals(exampleId));
      },
    );

    test('should return null when example not found in local or API', () async {
      // Arrange
      const String nonExistentId = 'non_existent';

      // Act
      final Example? result = await repository.get(nonExistentId);

      // Assert
      expect(result, isNull);
    });
  });
}
