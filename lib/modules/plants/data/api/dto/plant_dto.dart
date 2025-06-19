import 'package:demo_flutter_cursor/modules/plants/data/storage/entity/plant_entity.dart';
import 'package:demo_flutter_cursor/modules/plants/domain/models/plant.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant_dto.freezed.dart';
part 'plant_dto.g.dart';

@freezed
abstract class PlantDTO with _$PlantDTO {
  const factory PlantDTO({
    String? id,
    @JsonKey(name: 'creation_date') DateTime? creationDate,
    @JsonKey(name: 'last_update_date') DateTime? lastUpdateDate,
    required String name,
    required String species,
    @JsonKey(name: 'care_notes') String? careNotes,
    @JsonKey(name: 'user_id') required String userId,
  }) = _PlantDTO;

  const PlantDTO._();

  factory PlantDTO.fromJson(Map<String, dynamic> json) => _$PlantDTOFromJson(json);

  factory PlantDTO.fromFirestore(String id, Map<String, dynamic> json) {
    return PlantDTO(
      id: id,
      creationDate: json['creation_date']?.toDate() as DateTime?,
      lastUpdateDate: json['last_update_date']?.toDate() as DateTime?,
      name: json['name'] as String,
      species: json['species'] as String,
      careNotes: json['care_notes'] as String?,
      userId: json['user_id'] as String,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'creation_date': creationDate,
      'last_update_date': lastUpdateDate,
      'name': name,
      'species': species,
      'care_notes': careNotes,
      'user_id': userId,
    };
  }

  PlantEntity toEntity() {
    return PlantEntity(
      id: id!,
      creationDate: creationDate,
      lastUpdateDate: lastUpdateDate,
      name: name,
      species: species,
      careNotes: careNotes,
      userId: userId,
    );
  }

  Plant toModel() {
    return Plant(
      id: id!,
      creationDate: creationDate,
      lastUpdateDate: lastUpdateDate,
      name: name,
      species: species,
      careNotes: careNotes,
      userId: userId,
    );
  }
}
