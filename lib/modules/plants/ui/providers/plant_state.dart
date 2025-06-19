import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_state.freezed.dart';

@freezed
abstract class PlantState with _$PlantState {
  const factory PlantState({
    @Default([]) List<Plant> plants,
    @Default(false) bool isLoading,
    String? error,
  }) = _PlantState;

  const PlantState._();
}
