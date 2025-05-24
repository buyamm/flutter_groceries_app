import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
    : super(
        LoginState(
          emailError: "",
          passwordError: "",
          loading: false,
          loginStatus: LoginStatus.initial,
          // isLoginSuccess: false,
        ),
      );

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return password.length >= 6;
  }

  // bool isFormValid(String email, String password) {
  //   return isEmailValid(email) && isPasswordValid(password);
  // }

  void onEmailChanged(String email) {
    final checkEmailValid = isEmailValid(email);
    if (!checkEmailValid) {
      emit(state.copyWith(emailError: "Please enter a valid email!"));
    } else {
      emit(state.copyWith(emailError: ""));
    }
  }

  void onPasswordChanged(String password) {
    final checkPasswordValid = isPasswordValid(password);
    if (!checkPasswordValid) {
      emit(
        state.copyWith(
          passwordError:
              "Please enter a password that is at least 6 characters",
        ),
      );
    } else {
      emit(state.copyWith(passwordError: ""));
    }
  }

  void login(String email, String password) async {
    emit(state.copyWith(loading: true));
    await Future.delayed(Duration(seconds: 3));

    if (email == "admin@gmail.com" && password == "123456") {
      emit(state.copyWith(loginStatus: LoginStatus.success, loading: false));
    } else {
      emit(state.copyWith(loginStatus: LoginStatus.failure, loading: false));
    }
  }

  bool isEnableButton(String email, String password) =>
      isEmailValid(email) && isPasswordValid(password);
}
