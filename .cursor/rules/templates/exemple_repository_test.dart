import 'package:flutter_test/flutter_test.dart';
import 'exemple_api_fake.dart';
import 'exemple_dao_fake.dart';
import 'exemple_entity.dart';
import 'exemple_repository.dart';

void main() {
  late ExampleApiFake apiFake;
  late ExempleDaoFake daoFake;
  late ExempleRepository repository;

  setUp(() {
    apiFake = ExampleApiFake();
    daoFake = ExempleDaoFake();
    repository = ExempleRepository(api: apiFake, dao: daoFake);
  });

  test(
    'dao is empty, api returns an entity => should return the api entity and save it locally',
    () async {
      // Given
      final entity = ExampleEntity(id: '1', name: 'test');
      apiFake.currentFake = entity;
      daoFake.currentEntity = null;

      // When
      final result = await repository.getEntity('1');

      // Then
      expect(result, equals(entity), reason: 'Should return the API entity');
      expect(
        daoFake.currentEntity,
        equals(entity),
        reason: 'Should have saved the entity locally',
      );
    },
  );

  test(
    'dao has an entity, api is not called => should return the dao entity',
    () async {
      // Given
      final entityDao = ExampleEntity(id: '1', name: 'test local');
      final entityApi = ExampleEntity(id: '1', name: 'test api');
      daoFake.currentEntity = entityDao;
      apiFake.currentFake = entityApi;

      // When
      final result = await repository.getEntity('1');

      // Then
      expect(result, equals(entityDao), reason: 'Should return the DAO entity');
      expect(
        result?.name,
        equals('test local'),
        reason: 'The name should be the one from the local entity',
      );
    },
  );

  test('dao is empty, api is empty => should return null', () async {
    // Given
    daoFake.currentEntity = null;
    apiFake.currentFake = null;

    // When
    final result = await repository.getEntity('1');

    // Then
    expect(
      result,
      isNull,
      reason: 'Should return null when no entity is found',
    );
  });
}
