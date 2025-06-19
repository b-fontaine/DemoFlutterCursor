import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';

class FakePlantRepository implements PlantRepository {
  final List<Plant> _plants = [];

  @override
  Future<List<Plant>> getAll() async {
    return List.from(_plants);
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
  Future<Plant> add(Plant plant) async {
    _plants.add(plant);
    return plant;
  }

  @override
  Future<Plant> update(Plant plant) async {
    final index = _plants.indexWhere((p) => p.id == plant.id);
    if (index != -1) {
      _plants[index] = plant;
    }
    return plant;
  }

  @override
  Future<void> delete(String id) async {
    _plants.removeWhere((plant) => plant.id == id);
  }
}
