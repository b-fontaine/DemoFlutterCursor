// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_flutter_cursor/core/data/api/dto/json_converters.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
sealed class UserDTO with _$UserDTO {
  const factory UserDTO({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    @JsonKey(name: 'creation_date')
    @TimestampConverter()
    DateTime? creationDate,
    @JsonKey(name: 'last_update_date')
    @TimestampConverter()
    DateTime? lastUpdateDate,
    String? name,
    String? email,
    String? avatarPath,
    bool? onboarded,
  }) = UserDTOData;

  const UserDTO._();

  factory UserDTO.fromJson(String id, Map<String, dynamic> json) =>
      _$UserDTOFromJson(json..['id'] = id);
}
