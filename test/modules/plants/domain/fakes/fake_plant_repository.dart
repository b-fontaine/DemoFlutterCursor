import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';

class FakePlantRepository implements PlantRepository {
  final List<Plant> _plants = [];

  void addPlant(Plant plant) {
    _plants.add(plant);
  }

  void clear() {
    _plants.clear();
  }

  @override
  Future<List<Plant>> getUserPlants(String userId) async {
    return _plants.where((plant) => plant.userId == userId).toList();
  }

  @override
  Future<Plant?> get(String id) async {
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> create(Plant plant) async {
    _plants.add(plant);
  }

  @override
  Future<void> update(Plant plant) async {
    final index = _plants.indexWhere((p) => p.id == plant.id);
    if (index != -1) {
      _plants[index] = plant;
    }
  }

  @override
  Future<void> delete(String id) async {
    _plants.removeWhere((plant) => plant.id == id);
  }
}
