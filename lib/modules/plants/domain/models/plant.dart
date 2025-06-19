import 'package:freezed_annotation/freezed_annotation.dart';

part 'plant.freezed.dart';

@freezed
sealed class Plant with _$Plant {
  const factory Plant({
    required String id,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
    required String name,
    required String species,
    String? careNotes,
    required String userId,
  }) = _Plant;

  const Plant._();
}
