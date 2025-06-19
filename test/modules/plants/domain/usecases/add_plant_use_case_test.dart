import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
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
  group('AddPlantUseCase', () {
    late AddPlantUseCase useCase;
    late FakePlantRepository repository;

    setUp(() {
      repository = FakePlantRepository();
      useCase = AddPlantUseCase(plantRepository: repository);
    });

    test('should add plant with required fields', () async {
      const name = 'Rose';
      const type = 'Flower';

      final result = await useCase(name: name, type: type);

      expect(result.name, equals(name));
      expect(result.type, equals(type));
      expect(result.id, isNotEmpty);
      expect(result.creationDate, isNotNull);
      expect(result.lastUpdateDate, isNotNull);

      final plants = await repository.getAll();
      expect(plants, hasLength(1));
      expect(plants.first, equals(result));
    });

    test('should add plant with description', () async {
      const name = 'Cactus';
      const type = 'Succulent';
      const description = 'Small desert plant';

      final result = await useCase(
        name: name,
        type: type,
        description: description,
      );

      expect(result.name, equals(name));
      expect(result.type, equals(type));
      expect(result.description, equals(description));

      final plants = await repository.getAll();
      expect(plants, hasLength(1));
      expect(plants.first.description, equals(description));
    });
  });
}
