import 'package:demo_flutter_cursor/modules/plants/domain/di/repository_providers.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final updatePlantUseCaseProvider = Provider<UpdatePlantUseCase>((ref) {
  return UpdatePlantUseCase(
    plantRepository: ref.read(plantRepositoryProvider),
  );
});

class UpdatePlantUseCase {
  final PlantRepository _plantRepository;

  UpdatePlantUseCase({required PlantRepository plantRepository})
      : _plantRepository = plantRepository;

  Future<Plant> call(Plant plant) async {
    final updatedPlant = plant.copyWith(
      lastUpdateDate: DateTime.now(),
    );

    return await _plantRepository.update(updatedPlant);
  }
}
