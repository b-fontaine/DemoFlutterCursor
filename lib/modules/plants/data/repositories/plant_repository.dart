import 'package:demo_flutter_cursor/modules/plants/data/api/plant_api.dart';
import 'package:demo_flutter_cursor/modules/plants/data/api/dto/plant_dto.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/plant_dao.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plantApiProvider = Provider<PlantApi>((ref) => PlantApiImpl());
final plantDaoProvider = Provider<PlantDao>((ref) => PlantDaoImpl());

class PlantRepositoryImpl implements PlantRepository {
  final PlantApi _api;
  final PlantDao _dao;

  PlantRepositoryImpl({required PlantApi api, required PlantDao dao})
      : _api = api,
        _dao = dao;

  @override
  Future<List<Plant>> getAll() async {
    var entities = await _dao.getAll();
    if (entities.isNotEmpty) {
      return entities.map((entity) => entity.toModel()).toList();
    }

    final dtos = await _api.getAll();
    entities = dtos.map((dto) => dto.toEntity()).toList();
    for (final entity in entities) {
      await _dao.save(entity);
    }
    return entities.map((entity) => entity.toModel()).toList();
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
  Future<Plant> add(Plant plant) async {
    final dto = PlantDto(
      id: plant.id,
      creationDate: plant.creationDate,
      lastUpdateDate: plant.lastUpdateDate,
      name: plant.name,
      type: plant.type,
      description: plant.description,
    );

    final savedDto = await _api.add(dto);
    final entity = savedDto.toEntity();
    await _dao.save(entity);
    return entity.toModel();
  }

  @override
  Future<Plant> update(Plant plant) async {
    final dto = PlantDto(
      id: plant.id,
      creationDate: plant.creationDate,
      lastUpdateDate: plant.lastUpdateDate,
      name: plant.name,
      type: plant.type,
      description: plant.description,
    );

    final updatedDto = await _api.update(dto);
    final entity = updatedDto.toEntity();
    await _dao.save(entity);
    return entity.toModel();
  }

  @override
  Future<void> delete(String id) async {
    await _api.delete(id);
    await _dao.delete(id);
  }
}
