part of 'login_controller.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String? password,
    @Default('') String? errorMessage,
  }) = _LoginState;
}
