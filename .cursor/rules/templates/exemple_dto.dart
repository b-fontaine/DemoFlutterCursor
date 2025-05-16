// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter_cursor/core/data/api/dto/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_dto.freezed.dart';
part 'example_dto.g.dart';

@freezed
sealed class ExampleDTO with _$ExampleDTO {
  const factory ExampleDTO({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: 'creation_date')
    @TimestampConverter()
    DateTime? creationDate,
    @JsonKey(name: 'last_update_date')
    @TimestampConverter()
    DateTime? lastUpdateDate,
    required String name,
    String? description,
  }) = ExampleDTOData;

  const ExampleDTO._();

  factory ExampleDTO.fromJson(String id, Map<String, dynamic> json) =>
      _$ExampleDTOFromJson(json..['id'] = id);
}
