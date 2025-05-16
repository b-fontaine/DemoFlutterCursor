import 'exemple_entity.dart';

abstract class ExempleDao {
  Future<void> save(ExampleEntity entity);
  Future<ExampleEntity?> get(String id);
}
