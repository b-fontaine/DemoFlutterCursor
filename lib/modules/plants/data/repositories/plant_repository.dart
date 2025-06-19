import 'package:demo_flutter_cursor/modules/plants/data/api/dto/plant_dto.dart';
import 'package:demo_flutter_cursor/modules/plants/data/api/plant_api.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/plant_dao.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';

class PlantRepositoryImpl implements PlantRepository {
  final PlantApi _api;
  final PlantDao _dao;

  PlantRepositoryImpl({required PlantApi api, required PlantDao dao})
    : _api = api,
      _dao = dao;

  @override
  Future<List<Plant>> getUserPlants(String userId) async {
    var entities = await _dao.getUserPlants(userId);
    if (entities.isNotEmpty) {
      return entities.map((entity) => entity.toModel()).toList();
    }

    final dtos = await _api.getUserPlants(userId);
    final plants = <Plant>[];
    for (final dto in dtos) {
      final entity = dto.toEntity();
      await _dao.save(entity);
      plants.add(entity.toModel());
    }
    return plants;
  }

  @override
  Future<Plant?> get(String id) async {
    var entity = await _dao.get(id);
    if (entity != null) {
      return entity.toModel();
    }

    final dto = await _api.get(id);
    entity = dto?.toEntity();
    if (entity != null) {
      await _dao.save(entity);
    }
    return entity?.toModel();
  }

  @override
  Future<void> create(Plant plant) async {
    final dto = PlantDTO(
      id: plant.id,
      creationDate: plant.creationDate,
      lastUpdateDate: plant.lastUpdateDate,
      name: plant.name,
      species: plant.species,
      careNotes: plant.careNotes,
      userId: plant.userId,
    );
    await _api.create(dto);
    await _dao.save(dto.toEntity());
  }

  @override
  Future<void> update(Plant plant) async {
    final dto = PlantDTO(
      id: plant.id,
      creationDate: plant.creationDate,
      lastUpdateDate: plant.lastUpdateDate,
      name: plant.name,
      species: plant.species,
      careNotes: plant.careNotes,
      userId: plant.userId,
    );
    await _api.update(dto);
    await _dao.save(dto.toEntity());
  }

  @override
  Future<void> delete(String id) async {
    await _api.delete(id);
    await _dao.delete(id);
  }
}
