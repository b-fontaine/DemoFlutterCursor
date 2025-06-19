import 'package:demo_flutter_cursor/modules/plants/data/api/plant_api.dart';
import 'package:demo_flutter_cursor/modules/plants/data/api/dto/plant_dto.dart';

class FakePlantApi implements PlantApi {
  final List<PlantDto> _plants = [];

  @override
  Future<List<PlantDto>> getAll() async {
    return List.from(_plants);
  }

  @override
  Future<PlantDto?> get(String id) async {
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<PlantDto> add(PlantDto plant) async {
    _plants.add(plant);
    return plant;
  }

  @override
  Future<PlantDto> update(PlantDto plant) async {
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
