import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/states/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
    : super(
        SignupState(
          usernameError: "",
          emailError: "",
          passwordError: "",
          isShowPassword: false,
          signUpStatus: SignUpStatus.initial,
          loading: false,
        ),
      );

  bool isUsernameValid(String username) {
    return username.length >= 6;
  }

  bool isEmailValid(String email) {
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegExp.hasMatch(email);
  }

  bool isPasswordValid(String password) {
    return password.length >= 6;
  }

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

  void onUsernameChanged(String username) {
    final checkusernameValid = isUsernameValid(username);
    if (!checkusernameValid) {
      emit(
        state.copyWith(
          usernameError:
              "Please enter a username that is at least 6 characters",
        ),
      );
    } else {
      emit(state.copyWith(usernameError: ""));
    }
  }

  void showPassword(bool isShowPassword) {
    emit(state.copyWith(isShowPassword: isShowPassword));
  }

  bool isEnableButton(String username, String email, String password) =>
      isUsernameValid(username) &&
      isEmailValid(email) &&
      isPasswordValid(password);
}
