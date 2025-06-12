enum SignUpStatus { initial, success, failure }

class SignupState {
  final String usernameError;
  final String emailError;
  final String passwordError;
  final bool isShowPassword;
  final SignUpStatus signUpStatus;
  final bool loading;

  SignupState({
    required this.usernameError,
    required this.emailError,
    required this.passwordError,
    required this.isShowPassword,
    required this.signUpStatus,
    required this.loading,
  });

  SignupState copyWith({
    String? usernameError,
    String? emailError,
    String? passwordError,
    bool? isShowPassword,
    SignUpStatus? signUpStatus,
    bool? loading,
  }) {
    return SignupState(
      usernameError: usernameError ?? this.usernameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      loading: loading ?? this.loading,
      // isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
    );
  }
}
