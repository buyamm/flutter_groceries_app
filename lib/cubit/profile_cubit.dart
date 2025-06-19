import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_groceries_app/constants/api/api_constants.dart';
import 'package:flutter_groceries_app/models/profile/profile_response.dart';
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
        ),
      );
  final dio = Dio();

  void getUserInfo() async {
    try {
      emit(state.copyWith(isLoading: true)); // bật loading
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
}
