import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/constants/api/api_constants.dart';
import 'package:flutter_groceries_app/models/profile/profile_response.dart';
import 'package:flutter_groceries_app/screens/home.dart';
import 'package:flutter_groceries_app/screens/login.dart';
import 'package:flutter_groceries_app/states/profile_state.dart';
import 'package:flutter_groceries_app/storage/storage.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
    : super(
        ProfileState(
          displayName: "",
          email: "",
          errorMessage: "",
          profilePic: "",
          isLoading: false,
          isLoggingOut: false,
        ),
      );
  final dio = Dio();

  void getUserInfo() async {
    emit(state.copyWith(isLoading: true)); // bật loading
    try {
      String accessToken = await Storage.getToken() as String;
      final response = await dio.get(
        ApiConstants.getUserInfo,
        options: Options(headers: {"Authorization": "Bearer $accessToken"}),
      );

      ProfileResponse profileResponse = ProfileResponse.fromJson(response.data);

      if (response.statusCode == 200) {
        emit(
          state.copyWith(
            displayName: profileResponse.displayName,
            email: profileResponse.email,
            profilePic: profileResponse.profilePic,
            isLoading: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            errorMessage: response.data["message"],
            isLoading: false,
          ),
        );
      }
    } catch (e, stackTrace) {
      debugPrint("Error in getUserInfo: $e");
      debugPrint("$stackTrace");
      emit(
        state.copyWith(errorMessage: "Error when call API", isLoading: false),
      );
    }
  }

  void logout(BuildContext context) async {
    emit(state.copyWith(isLoggingOut: true)); // bật loading

    try {
      String accessToken = await Storage.getToken() as String;
      await Storage.removeToken(accessToken);

      emit(state.copyWith(isLoggingOut: false)); // tắt loading

      // chuyển hướng về LoginPage
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder:
              (_) => LoginPage(
                onLoginSuccess: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false,
                  );
                },
              ),
        ),
        (route) => false,
      );
    } catch (e) {
      debugPrint("Logout error: $e");
      emit(state.copyWith(isLoggingOut: false));
    }
  }
}
