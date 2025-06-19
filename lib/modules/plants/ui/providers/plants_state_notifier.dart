import 'package:demo_flutter_cursor/modules/plants/domain/usecases/add_plant_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/get_plants_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/usecases/update_plant_usecase.dart';
import 'package:demo_flutter_cursor/modules/plants/ui/providers/plants_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final plantsStateNotifierProvider =
    StateNotifierProvider<PlantsStateNotifier, PlantsState>((ref) {
  return PlantsStateNotifier(
    getPlantsUseCase: ref.read(getPlantsUseCaseProvider),
    addPlantUseCase: ref.read(addPlantUseCaseProvider),
    updatePlantUseCase: ref.read(updatePlantUseCaseProvider),
  );
});

class PlantsStateNotifier extends StateNotifier<PlantsState> {
  final GetPlantsUseCase _getPlantsUseCase;
  final AddPlantUseCase _addPlantUseCase;
  final UpdatePlantUseCase _updatePlantUseCase;

  PlantsStateNotifier({
    required GetPlantsUseCase getPlantsUseCase,
    required AddPlantUseCase addPlantUseCase,
    required UpdatePlantUseCase updatePlantUseCase,
  })  : _getPlantsUseCase = getPlantsUseCase,
        _addPlantUseCase = addPlantUseCase,
        _updatePlantUseCase = updatePlantUseCase,
        super(const PlantsState());

  Future<void> loadPlants() async {
    state = state.copyWith(isLoading: true, hasError: false);
    try {
      final plants = await _getPlantsUseCase();
      state = state.copyWith(
        plants: plants,
        isLoading: false,
        hasError: false,
      );
    } catch (e) {
      debugPrint('Error loading plants: $e');
      state = state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      );
    }
  }

  Future<bool> addPlant({
    required String name,
    required String type,
    String? description,
  }) async {
    try {
      final plant = await _addPlantUseCase(
        name: name,
        type: type,
        description: description,
      );
      
      state = state.copyWith(
        plants: [...state.plants, plant],
        hasError: false,
      );
      return true;
    } catch (e) {
      debugPrint('Error adding plant: $e');
      state = state.copyWith(
        hasError: true,
        errorMessage: e.toString(),
      );
      return false;
    }
  }

  Future<void> refresh() async {
    await loadPlants();
  }
}
