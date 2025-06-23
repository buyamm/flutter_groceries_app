import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/core/constants/api/api_constants.dart';
import 'package:flutter_groceries_app/data/dto/signup/signup_request.dart';
import 'package:flutter_groceries_app/data/dto/signup/signup_response.dart';
import 'package:flutter_groceries_app/presentation/features/signup/cubit/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit()
    : super(
        SignupState(
          firstNameError: "",
          lastNameError: "",
          usernameError: "",
          emailError: "",
          passwordError: "",
          isShowPassword: false,
          signUpStatus: SignUpStatus.initial,
          signUpMessage: "",
          loading: false,
        ),
      );

  final dio = Dio();

  bool isFirstNameValid(String firstName) {
    return firstName.length >= 6;
  }

  bool isLastNameValid(String lastName) {
    return lastName.length >= 6;
  }

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

  void onFirstNameChanged(String firstName) {
    final checkFirstNameValid = isFirstNameValid(firstName);
    if (!checkFirstNameValid) {
      emit(
        state.copyWith(
          firstNameError:
              "Please enter a first name that is at least 6 characters",
        ),
      );
    } else {
      emit(state.copyWith(firstNameError: ""));
    }
  }

  void onLastNameChanged(String lastName) {
    final checkLastNameValid = isLastNameValid(lastName);
    if (!checkLastNameValid) {
      emit(
        state.copyWith(
          lastNameError:
              "Please enter a last name that is at least 6 characters",
        ),
      );
    } else {
      emit(state.copyWith(lastNameError: ""));
    }
  }

  void showPassword(bool isShowPassword) {
    emit(state.copyWith(isShowPassword: isShowPassword));
  }

  bool isEnableButton(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
  ) =>
      isFirstNameValid(firstName) &&
      isLastNameValid(lastName) &&
      isUsernameValid(username) &&
      isEmailValid(email) &&
      isPasswordValid(password);

  void resetSignUpStatus() {
    emit(state.copyWith(signUpStatus: SignUpStatus.initial));
  }

  void signUp(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final signUpData =
          SignupRequest(
            username: username,
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
          ).toJson();
      final response = await dio.post(ApiConstants.register, data: signUpData);
      debugPrint("response.data: ${response.data['message']}");
      SignupResponse signupResponse = SignupResponse.fromJson(response.data);

      if (response.statusCode == 201) {
        emit(
          state.copyWith(
            signUpStatus: SignUpStatus.success,
            loading: false,
            signUpMessage: signupResponse.message,
          ),
        );
      } else {
        emit(
          state.copyWith(
            signUpStatus: SignUpStatus.failure,
            loading: false,
            signUpMessage: signupResponse.message,
          ),
        );
      }
    } catch (e) {
      debugPrint("---------Lỗi: dữ liệu ($e)----------------");
      emit(
        state.copyWith(
          signUpStatus: SignUpStatus.failure,
          loading: false,
          signUpMessage: "Error when call API",
        ),
      );
    }
  }
}
