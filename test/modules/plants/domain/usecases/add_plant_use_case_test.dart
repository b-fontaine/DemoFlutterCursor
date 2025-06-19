import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_plant_repository.dart';

void main() {
  late AddPlantUseCase addPlantUseCase;
  late FakePlantRepository fakePlantRepository;

  setUp(() {
    fakePlantRepository = FakePlantRepository();
    addPlantUseCase = AddPlantUseCase(
      plantRepository: fakePlantRepository,
    );
  });

  group('AddPlantUseCase', () {
    test(
      'should add plant to repository when called',
      () async {
        // Arrange
        const plant = Plant(id: '1', name: 'Rose', species: 'Rosa', userId: 'user1');

        // Act
        await addPlantUseCase(plant);

        // Assert
        final userPlants = await fakePlantRepository.getUserPlants('user1');
        expect(userPlants, hasLength(1));
        expect(userPlants.first, equals(plant));
      },
    );

    test(
      'should add multiple plants to repository',
      () async {
        // Arrange
        const plant1 = Plant(id: '1', name: 'Rose', species: 'Rosa', userId: 'user1');
        const plant2 = Plant(id: '2', name: 'Tulip', species: 'Tulipa', userId: 'user1');

        // Act
        await addPlantUseCase(plant1);
        await addPlantUseCase(plant2);

        // Assert
        final userPlants = await fakePlantRepository.getUserPlants('user1');
        expect(userPlants, hasLength(2));
        expect(userPlants, contains(plant1));
        expect(userPlants, contains(plant2));
      },
    );
  });
}
