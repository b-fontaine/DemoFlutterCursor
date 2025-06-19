import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plantDaoProvider = Provider<PlantDao>(
  (ref) => PlantDaoImpl(),
);

abstract class PlantDao {
  Future<List<PlantEntity>> getUserPlants(String userId);
  Future<PlantEntity?> get(String id);
  Future<void> save(PlantEntity plant);
  Future<void> delete(String id);
}

class PlantDaoImpl implements PlantDao {
  final Map<String, PlantEntity> _plants = {};

  @override
  Future<List<PlantEntity>> getUserPlants(String userId) async {
    return _plants.values.where((plant) => plant.userId == userId).toList();
  }

  @override
  Future<PlantEntity?> get(String id) async {
    return _plants[id];
  }

  @override
  Future<void> save(PlantEntity plant) async {
    _plants[plant.id] = plant;
  }

  @override
  Future<void> delete(String id) async {
    _plants.remove(id);
  }
}
