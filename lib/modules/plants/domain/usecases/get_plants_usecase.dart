import 'package:demo_flutter_cursor/modules/plants/domain/di/repository_providers.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPlantsUseCaseProvider = Provider<GetPlantsUseCase>((ref) {
  return GetPlantsUseCase(
    plantRepository: ref.read(plantRepositoryProvider),
  );
});

class GetPlantsUseCase {
  final PlantRepository _plantRepository;

  GetPlantsUseCase({required PlantRepository plantRepository})
      : _plantRepository = plantRepository;

  Future<List<Plant>> call() async {
    return await _plantRepository.getAll();
  }
}
