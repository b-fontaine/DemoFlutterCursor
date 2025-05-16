import 'package:demo_flutter_cursor/modules/authentication/ui/providers/models/email.dart';
import 'package:demo_flutter_cursor/modules/authentication/ui/providers/models/password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@freezed
sealed class SignupState with _$SignupState {
  const factory SignupState({
    required Email email,
    required Password password,
  }) = SignupStateData;

  const factory SignupState.sending({
    required Email email,
    required Password password,
  }) = SignupStateSending;

  const SignupState._();
}
