import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plants_state.freezed.dart';

@freezed
sealed class PlantsState with _$PlantsState {
  const factory PlantsState({
    @Default([]) List<Plant> plants,
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    String? errorMessage,
  }) = _PlantsState;

  const PlantsState._();

  bool get isEmpty => plants.isEmpty && !isLoading;
}
