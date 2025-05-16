import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:demo_flutter_cursor/core/data/entities/example_dto.dart';

part 'example.freezed.dart';

@freezed
sealed class Example with _$Example {
  const factory Example({
    String? id,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
    required String name,
    String? description,
  }) = _Example;

  const Example._();

  factory Example.fromDTO(ExampleDTO? dto) {
    if (dto == null) return const Example(name: '');

    return Example(
      id: dto.id,
      creationDate: dto.creationDate,
      lastUpdateDate: dto.lastUpdateDate,
      name: dto.name,
      description: dto.description,
    );
  }

  ExampleDTO toDTO() {
    return ExampleDTO(
      id: id,
      creationDate: creationDate,
      lastUpdateDate: lastUpdateDate,
      name: name,
      description: description,
    );
  }
}
