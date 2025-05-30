// ignore_for_file: invalid_annotation_target

import 'package:demo_flutter_cursor/modules/example/domain/models/example.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_entity.freezed.dart';
part 'example_entity.g.dart';

@freezed
sealed class ExampleEntity with _$ExampleEntity {
  const factory ExampleEntity({
    @JsonKey(includeIfNull: false) required String id,
    @JsonKey(name: 'creation_date') DateTime? creationDate,
    @JsonKey(name: 'last_update_date') DateTime? lastUpdateDate,
    required String name,
    String? description,
  }) = _ExampleEntity;

  const ExampleEntity._();

  factory ExampleEntity.fromJson(Map<String, dynamic> json) =>
      _$ExampleEntityFromJson(json);

  Example toModel() {
    return Example(
      id: id,
      creationDate: creationDate,
      lastUpdateDate: lastUpdateDate,
      name: name,
      description: description,
    );
  }
}
