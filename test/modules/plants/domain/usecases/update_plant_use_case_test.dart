import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/update_plant_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';

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
}

void main() {
  group('UpdatePlantUseCase', () {
    late UpdatePlantUseCase useCase;
    late FakePlantRepository repository;

    setUp(() {
      repository = FakePlantRepository();
      useCase = UpdatePlantUseCase(plantRepository: repository);
    });

    test('should update plant and set lastUpdateDate', () async {
      final originalDate = DateTime.now().subtract(const Duration(days: 1));
      final plant = Plant(
        id: '1',
        name: 'Rose',
        type: 'Flower',
        creationDate: originalDate,
        lastUpdateDate: originalDate,
      );

      await repository.add(plant);

      final updatedPlant = plant.copyWith(name: 'Updated Rose');
      final result = await useCase(updatedPlant);

      expect(result.name, equals('Updated Rose'));
      expect(result.lastUpdateDate, isNot(equals(originalDate)));
      expect(result.lastUpdateDate!.isAfter(originalDate), isTrue);

      final plants = await repository.getAll();
      expect(plants, hasLength(1));
      expect(plants.first.name, equals('Updated Rose'));
    });
  });
}
