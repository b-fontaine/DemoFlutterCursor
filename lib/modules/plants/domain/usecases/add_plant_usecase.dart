import 'package:demo_flutter_cursor/modules/plants/domain/di/repository_providers.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/repositories/plant_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addPlantUseCaseProvider = Provider<AddPlantUseCase>((ref) {
  return AddPlantUseCase(
    plantRepository: ref.read(plantRepositoryProvider),
  );
});

class AddPlantUseCase {
  final PlantRepository _plantRepository;

  AddPlantUseCase({required PlantRepository plantRepository})
      : _plantRepository = plantRepository;

  Future<Plant> call({
    required String name,
    required String type,
    String? description,
  }) async {
    final plant = Plant(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      type: type,
      description: description,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
    );

    return await _plantRepository.add(plant);
  }
}
