import 'package:demo_flutter_cursor/modules/plants/domain/di/repository_providers.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final getUserPlantsUseCaseProvider = Provider<GetUserPlantsUseCase>((ref) {
  return GetUserPlantsUseCase(
    plantRepository: ref.read(plantRepositoryProvider),
  );
});

class GetUserPlantsUseCase {
  final PlantRepository _plantRepository;

  GetUserPlantsUseCase({required PlantRepository plantRepository})
    : _plantRepository = plantRepository;

  Future<List<Plant>> call(String userId) async {
    return await _plantRepository.getUserPlants(userId);
  }
}
