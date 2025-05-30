import 'package:demo_flutter_cursor/modules/example/data/api/example_api.dart';
import 'package:demo_flutter_cursor/modules/example/data/storage/example_dao.dart';
import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:demo_flutter_cursor/modules/example/domain/repositories/exemple_repository.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  final ExampleApi _api;
  final ExampleDao _dao;

  ExampleRepositoryImpl({required ExampleApi api, required ExampleDao dao})
    : _api = api,
      _dao = dao;

  @override
  Future<Example?> get(String id) async {
    // D'abord chercher en local
    var entity = await _dao.get(id);
    if (entity != null) {
      return entity.toModel();
    }

    // Sinon chercher via l'API
    final dto = await _api.get(id);
    entity = dto?.toEntity();
    if (entity != null) {
      // Sauvegarder en local pour les prochaines fois
      await _dao.save(entity);
    }
    return entity?.toModel();
  }
}
