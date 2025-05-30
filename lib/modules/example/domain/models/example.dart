import 'package:freezed_annotation/freezed_annotation.dart';

part 'example.freezed.dart';

@freezed
sealed class Example with _$Example {
  const factory Example({
    required String id,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
    required String name,
    String? description,
  }) = _Example;

  const Example._();
}
