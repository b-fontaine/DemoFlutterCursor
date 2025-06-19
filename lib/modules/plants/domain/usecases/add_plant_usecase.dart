import 'package:demo_flutter_cursor/modules/plants/domain/di/repository_providers.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final addPlantUseCaseProvider = Provider<AddPlantUseCase>((ref) {
  return AddPlantUseCase(
    plantRepository: ref.read(plantRepositoryProvider),
  );
});

class AddPlantUseCase {
  final PlantRepository _plantRepository;

  AddPlantUseCase({required PlantRepository plantRepository})
    : _plantRepository = plantRepository;

  Future<void> call(Plant plant) async {
    await _plantRepository.create(plant);
  }
}
