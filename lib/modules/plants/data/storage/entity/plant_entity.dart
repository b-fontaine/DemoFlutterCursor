import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_entity.freezed.dart';
part 'plant_entity.g.dart';

@freezed
sealed class PlantEntity with _$PlantEntity {
  const factory PlantEntity({
    required String id,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
    required String name,
    required String type,
    String? description,
  }) = _PlantEntity;

  const PlantEntity._();

  factory PlantEntity.fromJson(Map<String, dynamic> json) =>
      _$PlantEntityFromJson(json);

  Plant toModel() {
    return Plant(
      id: id,
      creationDate: creationDate,
      lastUpdateDate: lastUpdateDate,
      name: name,
      type: type,
      description: description,
    );
  }
}
