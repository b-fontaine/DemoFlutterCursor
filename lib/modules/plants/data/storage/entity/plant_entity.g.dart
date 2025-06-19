// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlantEntity _$PlantEntityFromJson(Map json) => _PlantEntity(
  id: json['id'] as String,
  creationDate:
      json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
  lastUpdateDate:
      json['lastUpdateDate'] == null
          ? null
          : DateTime.parse(json['lastUpdateDate'] as String),
  name: json['name'] as String,
  type: json['type'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$PlantEntityToJson(_PlantEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creationDate': instance.creationDate?.toIso8601String(),
      'lastUpdateDate': instance.lastUpdateDate?.toIso8601String(),
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
    };
