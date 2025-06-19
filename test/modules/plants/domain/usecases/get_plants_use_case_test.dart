import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/get_plants_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePlantRepository implements PlantRepository {
  List<Plant> _plants = [];

  @override
  Future<List<Plant>> getAll() async {
    return _plants;
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

  void setPlants(List<Plant> plants) {
    _plants = plants;
  }
}

void main() {
  group('GetPlantsUseCase', () {
    late GetPlantsUseCase useCase;
    late FakePlantRepository repository;

    setUp(() {
      repository = FakePlantRepository();
      useCase = GetPlantsUseCase(plantRepository: repository);
    });

    test('should return empty list when no plants exist', () async {
      final result = await useCase();

      expect(result, isEmpty);
    });

    test('should return all plants when plants exist', () async {
      final plant1 = Plant(
        id: '1',
        name: 'Rose',
        type: 'Flower',
        description: 'Beautiful red rose',
        creationDate: DateTime.now(),
      );
      final plant2 = Plant(
        id: '2',
        name: 'Cactus',
        type: 'Succulent',
        creationDate: DateTime.now(),
      );

      await repository.add(plant1);
      await repository.add(plant2);

      final result = await useCase();

      expect(result, hasLength(2));
      expect(result, contains(plant1));
      expect(result, contains(plant2));
    });
  });
}
