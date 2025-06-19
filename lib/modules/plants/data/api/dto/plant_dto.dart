import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_dto.freezed.dart';
part 'plant_dto.g.dart';

@freezed
sealed class PlantDto with _$PlantDto {
  const factory PlantDto({
    required String id,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
    required String name,
    required String type,
    String? description,
  }) = _PlantDto;

  const PlantDto._();

  factory PlantDto.fromJson(Map<String, dynamic> json) =>
      _$PlantDtoFromJson(json);

  PlantEntity toEntity() {
    return PlantEntity(
      id: id,
      creationDate: creationDate,
      lastUpdateDate: lastUpdateDate,
      name: name,
      type: type,
      description: description,
    );
  }

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
