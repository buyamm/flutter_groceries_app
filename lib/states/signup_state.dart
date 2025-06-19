enum SignUpStatus { initial, success, failure }

class SignupState {
  final String firstNameError;
  final String lastNameError;
  final String usernameError;
  final String emailError;
  final String passwordError;
  final bool isShowPassword;
  final SignUpStatus signUpStatus;
  final String signUpMessage;
  final bool loading;

  SignupState({
    required this.firstNameError,
    required this.lastNameError,
    required this.usernameError,
    required this.emailError,
    required this.passwordError,
    required this.isShowPassword,
    required this.signUpStatus,
    required this.signUpMessage,
    required this.loading,
  });

  SignupState copyWith({
    String? firstNameError,
    String? lastNameError,
    String? usernameError,
    String? emailError,
    String? passwordError,
    bool? isShowPassword,
    SignUpStatus? signUpStatus,
    String? signUpMessage,
    bool? loading,
  }) {
    return SignupState(
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      usernameError: usernameError ?? this.usernameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      signUpStatus: signUpStatus ?? this.signUpStatus,
      signUpMessage: signUpMessage ?? this.signUpMessage,
      loading: loading ?? this.loading,
    );
  }
}
