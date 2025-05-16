import 'package:demo_flutter_cursor/core/data/api/exemple_api.dart';
import 'package:demo_flutter_cursor/core/data/storage/exemple_dao.dart';
import 'package:demo_flutter_cursor/core/data/entities/exemple_entity.dart';

class ExempleRepository {
  final ExempleApi _api;
  final ExempleDao _dao;

  ExempleRepository({required ExempleApi api, required ExempleDao dao})
    : _api = api,
      _dao = dao;

  Future<ExempleEntity?> getEntity(String userId) async {
    // D'abord chercher en local
    final localEntity = await _dao.get(userId);
    if (localEntity != null) {
      return localEntity;
    }

    // Sinon chercher via l'API
    final apiEntity = await _api.get(userId);
    if (apiEntity != null) {
      // Sauvegarder en local pour les prochaines fois
      await _dao.save(apiEntity);
    }
    return apiEntity;
  }
}
