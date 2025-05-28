enum LoginStatus { initial, success, failure }

class LoginState {
  final String emailError;
  final String passwordError;
  final bool loading;
  final LoginStatus loginStatus;
  // final bool isLoginSuccess;

  LoginState({
    required this.emailError,
    required this.passwordError,
    required this.loading,
    required this.loginStatus,
  });

  LoginState copyWith({
    String? emailError,
    String? passwordError,
    bool? loading,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      loading: loading ?? this.loading,
      loginStatus: loginStatus ?? this.loginStatus,
      // isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
