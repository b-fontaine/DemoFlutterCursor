import 'package:demo_flutter_cursor/modules/plants/data/api/dto/plant_dto.dart';
import 'package:demo_flutter_cursor/modules/plants/data/repositories/plant_repository.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_flutter_cursor/modules/plants/data/api/plant_api.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/plant_dao.dart';
import 'package:demo_flutter_cursor/modules/plants/data/api/dto/plant_dto.dart';
import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';

class FakePlantApi implements PlantApi {
  List<PlantDto> _plants = [];
  bool shouldThrowError = false;

  @override
  Future<List<PlantDto>> getAll() async {
    if (shouldThrowError) {
      throw Exception('API Error');
    }
    return _plants;
  }

  @override
  Future<PlantDto?> get(String id) async {
    if (shouldThrowError) {
      throw Exception('API Error');
    }
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<PlantDto> add(PlantDto plant) async {
    if (shouldThrowError) {
      throw Exception('API Error');
    }
    _plants.add(plant);
    return plant;
  }

  @override
  Future<PlantDto> update(PlantDto plant) async {
    if (shouldThrowError) {
      throw Exception('API Error');
    }
    final index = _plants.indexWhere((p) => p.id == plant.id);
    if (index != -1) {
      _plants[index] = plant;
    }
    return plant;
  }

  @override
  Future<void> delete(String id) async {
    if (shouldThrowError) {
      throw Exception('API Error');
    }
    _plants.removeWhere((plant) => plant.id == id);
  }

  void setPlants(List<PlantDto> plants) {
    _plants = plants;
  }
}

class FakePlantDao implements PlantDao {
  List<PlantEntity> _plants = [];
  bool shouldThrowError = false;

  @override
  Future<List<PlantEntity>> getAll() async {
    if (shouldThrowError) {
      throw Exception('DAO Error');
    }
    return _plants;
  }

  @override
  Future<PlantEntity?> get(String id) async {
    if (shouldThrowError) {
      throw Exception('DAO Error');
    }
    try {
      return _plants.firstWhere((plant) => plant.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<PlantEntity> add(PlantEntity plant) async {
    if (shouldThrowError) {
      throw Exception('DAO Error');
    }
    _plants.add(plant);
    return plant;
  }

  @override
  Future<PlantEntity> update(PlantEntity plant) async {
    if (shouldThrowError) {
      throw Exception('DAO Error');
    }
    final index = _plants.indexWhere((p) => p.id == plant.id);
    if (index != -1) {
      _plants[index] = plant;
    }
    return plant;
  }

  @override
  Future<void> delete(String id) async {
    if (shouldThrowError) {
      throw Exception('DAO Error');
    }
    _plants.removeWhere((plant) => plant.id == id);
  }

  @override
  Future<void> save(PlantEntity plant) async {
    if (shouldThrowError) {
      throw Exception('DAO Error');
    }
    final index = _plants.indexWhere((p) => p.id == plant.id);
    if (index != -1) {
      _plants[index] = plant;
    } else {
      _plants.add(plant);
    }
  }

  void setPlants(List<PlantEntity> plants) {
    _plants = plants;
  }
}

void main() {
  group('PlantRepositoryImpl', () {
    late PlantRepositoryImpl repository;
    late FakePlantApi api;
    late FakePlantDao dao;

    setUp(() {
      api = FakePlantApi();
      dao = FakePlantDao();
      repository = PlantRepositoryImpl(api: api, dao: dao);
    });

    group('getAll', () {
      test('should return plants from DAO when available', () async {
        final entity = PlantEntity(
          id: '1',
          name: 'Rose',
          type: 'Flower',
          creationDate: DateTime.now(),
        );
        await dao.save(entity);

        final result = await repository.getAll();

        expect(result, hasLength(1));
        expect(result.first.name, equals('Rose'));
      });

      test('should fetch from API and save to DAO when DAO is empty', () async {
        final dto = PlantDto(
          id: '1',
          name: 'Cactus',
          type: 'Succulent',
          creationDate: DateTime.now(),
        );
        await api.add(dto);

        final result = await repository.getAll();

        expect(result, hasLength(1));
        expect(result.first.name, equals('Cactus'));

        final daoPlants = await dao.getAll();
        expect(daoPlants, hasLength(1));
      });
    });

    group('add', () {
      test('should add plant via API and save to DAO', () async {
        final plant = Plant(
          id: '1',
          name: 'Tulip',
          type: 'Flower',
          creationDate: DateTime.now(),
        );

        final result = await repository.add(plant);

        expect(result.name, equals('Tulip'));

        final apiPlants = await api.getAll();
        expect(apiPlants, hasLength(1));

        final daoPlants = await dao.getAll();
        expect(daoPlants, hasLength(1));
      });
    });
  });
}
