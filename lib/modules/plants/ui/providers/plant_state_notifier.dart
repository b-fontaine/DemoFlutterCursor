import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/get_user_plants_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/plant_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plantStateNotifierProvider =
    StateNotifierProvider<PlantStateNotifier, PlantState>((ref) {
      return PlantStateNotifier(
        getUserPlantsUseCase: ref.read(getUserPlantsUseCaseProvider),
        addPlantUseCase: ref.read(addPlantUseCaseProvider),
      );
    });

class PlantStateNotifier extends StateNotifier<PlantState> {
  final GetUserPlantsUseCase _getUserPlantsUseCase;
  final AddPlantUseCase _addPlantUseCase;

  PlantStateNotifier({
    required GetUserPlantsUseCase getUserPlantsUseCase,
    required AddPlantUseCase addPlantUseCase,
  }) : _getUserPlantsUseCase = getUserPlantsUseCase,
       _addPlantUseCase = addPlantUseCase,
       super(const PlantState());

  Future<void> loadUserPlants(String userId) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final plants = await _getUserPlantsUseCase(userId);
      state = state.copyWith(plants: plants, isLoading: false);
    } catch (e) {
      debugPrint('Error loading plants: $e');
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> addPlant({
    required String name,
    required String species,
    String? careNotes,
    required String userId,
  }) async {
    try {
      final plant = Plant(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        species: species,
        careNotes: careNotes,
        userId: userId,
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
      );

      await _addPlantUseCase(plant);
      
      final updatedPlants = [...state.plants, plant];
      state = state.copyWith(plants: updatedPlants);
    } catch (e) {
      debugPrint('Error adding plant: $e');
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> refresh(String userId) async {
    await loadUserPlants(userId);
  }
}
