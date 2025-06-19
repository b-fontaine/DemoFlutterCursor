import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/plants_state_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/get_plants_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/update_plant_usecase.dart';

class FakeGetPlantsUseCase implements GetPlantsUseCase {
  List<Plant> _plants = [];
  bool shouldThrowError = false;

  void addPlant(Plant plant) {
    _plants.add(plant);
  }

  @override
  Future<List<Plant>> call() async {
    if (shouldThrowError) {
      throw Exception('Test error');
    }
    return _plants;
  }
}

class FakeAddPlantUseCase implements AddPlantUseCase {
  bool shouldThrowError = false;
  Plant? lastAddedPlant;

  @override
  Future<Plant> call({
    required String name,
    required String type,
    String? description,
  }) async {
    if (shouldThrowError) {
      throw Exception('Test error');
    }
    
    final plant = Plant(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      type: type,
      description: description,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
    );
    
    lastAddedPlant = plant;
    return plant;
  }
}

class FakeUpdatePlantUseCase implements UpdatePlantUseCase {
  bool shouldThrowError = false;

  @override
  Future<Plant> call(Plant plant) async {
    if (shouldThrowError) {
      throw Exception('Test error');
    }
    return plant.copyWith(lastUpdateDate: DateTime.now());
  }
}

void main() {
  group('PlantsStateNotifier', () {
    late PlantsStateNotifier notifier;
    late FakeGetPlantsUseCase getPlantsUseCase;
    late FakeAddPlantUseCase addPlantUseCase;
    late FakeUpdatePlantUseCase updatePlantUseCase;

    setUp(() {
      getPlantsUseCase = FakeGetPlantsUseCase();
      addPlantUseCase = FakeAddPlantUseCase();
      updatePlantUseCase = FakeUpdatePlantUseCase();
      notifier = PlantsStateNotifier(
        getPlantsUseCase: getPlantsUseCase,
        addPlantUseCase: addPlantUseCase,
        updatePlantUseCase: updatePlantUseCase,
      );
    });

    test('initial state should be empty', () {
      expect(notifier.state.plants, isEmpty);
      expect(notifier.state.isLoading, isFalse);
      expect(notifier.state.hasError, isFalse);
    });

    test('loadPlants should update state with plants', () async {
      final plant = Plant(
        id: '1',
        name: 'Rose',
        type: 'Flower',
        creationDate: DateTime.now(),
      );
      getPlantsUseCase.addPlant(plant);

      await notifier.loadPlants();

      expect(notifier.state.plants, hasLength(1));
      expect(notifier.state.plants.first.name, equals('Rose'));
      expect(notifier.state.isLoading, isFalse);
      expect(notifier.state.hasError, isFalse);
    });

    test('loadPlants should handle errors', () async {
      getPlantsUseCase.shouldThrowError = true;

      await notifier.loadPlants();

      expect(notifier.state.plants, isEmpty);
      expect(notifier.state.isLoading, isFalse);
      expect(notifier.state.hasError, isTrue);
      expect(notifier.state.errorMessage, isNotNull);
    });

    test('addPlant should add plant to state', () async {
      final success = await notifier.addPlant(
        name: 'Cactus',
        type: 'Succulent',
        description: 'Small desert plant',
      );

      expect(success, isTrue);
      expect(notifier.state.plants, hasLength(1));
      expect(notifier.state.plants.first.name, equals('Cactus'));
      expect(notifier.state.hasError, isFalse);
    });

    test('addPlant should handle errors', () async {
      addPlantUseCase.shouldThrowError = true;

      final success = await notifier.addPlant(
        name: 'Cactus',
        type: 'Succulent',
      );

      expect(success, isFalse);
      expect(notifier.state.plants, isEmpty);
      expect(notifier.state.hasError, isTrue);
    });
  });
}
