import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/get_user_plants_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

import '../fakes/fake_plant_repository.dart';

void main() {
  late GetUserPlantsUseCase getUserPlantsUseCase;
  late FakePlantRepository fakePlantRepository;

  setUp(() {
    fakePlantRepository = FakePlantRepository();
    getUserPlantsUseCase = GetUserPlantsUseCase(
      plantRepository: fakePlantRepository,
    );
  });

  group('GetUserPlantsUseCase', () {
    test(
      'should return user plants when repository has plants for the user',
      () async {
        // Arrange
        const plant1 = Plant(id: '1', name: 'Rose', species: 'Rosa', userId: 'user1');
        const plant2 = Plant(id: '2', name: 'Tulip', species: 'Tulipa', userId: 'user1');
        const plant3 = Plant(id: '3', name: 'Daisy', species: 'Bellis', userId: 'user2');
        
        fakePlantRepository.addPlant(plant1);
        fakePlantRepository.addPlant(plant2);
        fakePlantRepository.addPlant(plant3);

        // Act
        final result = await getUserPlantsUseCase('user1');

        // Assert
        expect(result, hasLength(2));
        expect(result, contains(plant1));
        expect(result, contains(plant2));
        expect(result, isNot(contains(plant3)));
      },
    );

    test(
      'should return empty list when user has no plants',
      () async {
        // Arrange
        fakePlantRepository.clear();

        // Act
        final result = await getUserPlantsUseCase('user_with_no_plants');

        // Assert
        expect(result, isEmpty);
      },
    );
  });
}
