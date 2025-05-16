import 'exemple_dao.dart';
import 'exemple_entity.dart';

class ExempleDaoFake implements ExempleDao {
  ExampleEntity? currentEntity;

  @override
  Future<void> save(ExampleEntity entity) async {
    currentEntity = entity;
  }

  @override
  Future<ExampleEntity?> get(String id) async {
    return currentEntity;
  }
}
