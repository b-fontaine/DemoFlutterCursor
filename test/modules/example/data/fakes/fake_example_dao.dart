import 'package:demo_flutter_cursor/modules/example/data/storage/entity/example_entity.dart';
import 'package:demo_flutter_cursor/modules/example/data/storage/example_dao.dart';

class FakeExampleDao implements ExampleDao {
  final Map<String, ExampleEntity> _data = {};
  final List<ExampleEntity> _savedEntities = [];

  void addExample(String id, ExampleEntity entity) {
    _data[id] = entity;
  }

  List<ExampleEntity> getSavedEntities() {
    return _savedEntities;
  }

  @override
  Future<ExampleEntity?> get(String id) async {
    return _data[id];
  }

  @override
  Future<void> save(ExampleEntity entity) async {
    _data[entity.id] = entity;
    _savedEntities.add(entity);
  }

  @override
  Future<List<ExampleEntity>> getAll() async {
    return _data.values.toList();
  }

  @override
  Future<void> saveAll(List<ExampleEntity> examples) async {
    for (final example in examples) {
      await save(example);
    }
  }

  @override
  Future<void> delete(String id) async {
    _data.remove(id);
  }

  @override
  Future<void> deleteAll() async {
    _data.clear();
    _savedEntities.clear();
  }
}
