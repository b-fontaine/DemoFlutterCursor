// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExampleEntity _$ExampleEntityFromJson(Map json) => _ExampleEntity(
  id: json['id'] as String,
  creationDate:
      json['creation_date'] == null
          ? null
          : DateTime.parse(json['creation_date'] as String),
  lastUpdateDate:
      json['last_update_date'] == null
          ? null
          : DateTime.parse(json['last_update_date'] as String),
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$ExampleEntityToJson(_ExampleEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creation_date': instance.creationDate?.toIso8601String(),
      'last_update_date': instance.lastUpdateDate?.toIso8601String(),
      'name': instance.name,
      'description': instance.description,
    };
