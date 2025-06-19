// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantDTO _$PlantDTOFromJson(Map json) => _PlantDTO(
  id: json['id'] as String?,
  creationDate:
      json['creation_date'] == null
          ? null
          : DateTime.parse(json['creation_date'] as String),
  lastUpdateDate:
      json['last_update_date'] == null
          ? null
          : DateTime.parse(json['last_update_date'] as String),
  name: json['name'] as String,
  species: json['species'] as String,
  careNotes: json['care_notes'] as String?,
  userId: json['user_id'] as String,
);

Map<String, dynamic> _$PlantDTOToJson(_PlantDTO instance) => <String, dynamic>{
  'id': instance.id,
  'creation_date': instance.creationDate?.toIso8601String(),
  'last_update_date': instance.lastUpdateDate?.toIso8601String(),
  'name': instance.name,
  'species': instance.species,
  'care_notes': instance.careNotes,
  'user_id': instance.userId,
};
