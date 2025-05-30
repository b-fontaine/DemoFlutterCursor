// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleDTOData _$ExampleDTODataFromJson(Map json) => ExampleDTOData(
  id: json['id'] as String?,
  creationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['creation_date'],
    const TimestampConverter().fromJson,
  ),
  lastUpdateDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['last_update_date'],
    const TimestampConverter().fromJson,
  ),
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$ExampleDTODataToJson(ExampleDTOData instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'creation_date': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.creationDate,
        const TimestampConverter().toJson,
      ),
      'last_update_date': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.lastUpdateDate,
        const TimestampConverter().toJson,
      ),
      'name': instance.name,
      'description': instance.description,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
