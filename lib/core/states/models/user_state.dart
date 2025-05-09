import 'package:demo_flutter_cursor/core/data/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.freezed.dart';

@freezed
sealed class UserState with _$UserState {
  const factory UserState({required User user}) = UserStateData;

  const UserState._();
}
