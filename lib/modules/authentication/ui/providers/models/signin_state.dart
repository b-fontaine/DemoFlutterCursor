import 'package:demo_flutter_cursor/modules/authentication/ui/providers/models/email.dart';
import 'package:demo_flutter_cursor/modules/authentication/ui/providers/models/password.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'signin_state.freezed.dart';

@freezed
sealed class SigninState with _$SigninState {
  const factory SigninState({
    required Email email,
    required Password password,
  }) = SigninStateData;

  const factory SigninState.sending({
    required Email email,
    required Password password,
  }) = SigninStateSending;

  const SigninState._();
}
