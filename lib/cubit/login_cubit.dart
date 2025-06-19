import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/constants/api/api_constants.dart';
import 'package:flutter_groceries_app/models/login/login_request.dart';
import 'package:flutter_groceries_app/models/login/login_response.dart';
import 'package:flutter_groceries_app/states/login_state.dart';
import 'package:flutter_groceries_app/storage/storage.dart';

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

  final dio = Dio();

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

  Future<void> login(String email, String password) async {
    emit(state.copyWith(loading: true));
    // await Future.delayed(Duration(seconds: 3));

    // if (email == "admin@gmail.com" && password == "123456") {
    //   emit(state.copyWith(loginStatus: LoginStatus.success, loading: false));
    // } else {
    //   emit(state.copyWith(loginStatus: LoginStatus.failure, loading: false));
    // }

    try {
      final loginData = LoginRequest(email: email, password: password).toJson();
      final response = await dio.post(ApiConstants.login, data: loginData);

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        await Storage.saveToken(loginResponse.accessToken);
        emit(state.copyWith(loginStatus: LoginStatus.success, loading: false));
      } else {
        emit(state.copyWith(loginStatus: LoginStatus.failure, loading: false));
      }
    } catch (e) {
      emit(state.copyWith(loginStatus: LoginStatus.failure, loading: false));
    }
  }

  void resetLoginStatus() {
    emit(state.copyWith(loginStatus: LoginStatus.initial));
  }

  bool isEnableButton(String email, String password) =>
      isEmailValid(email) && isPasswordValid(password);
}
