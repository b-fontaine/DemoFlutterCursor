import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';

abstract class PlantDao {
  Future<List<PlantEntity>> getAll();
  Future<PlantEntity?> get(String id);
  Future<void> save(PlantEntity plant);
  Future<void> delete(String id);
}

class PlantDaoImpl implements PlantDao {
  final List<PlantEntity> _plants = [];

  @override
  Future<List<PlantEntity>> getAll() async {
    return List.from(_plants);
  }

  @override
  Future<PlantEntity?> get(String id) async {
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> save(PlantEntity plant) async {
    final index = _plants.indexWhere((p) => p.id == plant.id);
    if (index != -1) {
      _plants[index] = plant;
    } else {
      _plants.add(plant);
    }
  }

  @override
  Future<void> delete(String id) async {
    _plants.removeWhere((plant) => plant.id == id);
  }
}
