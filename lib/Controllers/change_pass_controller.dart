import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/Models/change_pass_model.dart';
import 'package:graduation_project/core/Services/handle_dio_error.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../API/endpoints.dart';

//
// class ChangePasswordController extends GetxController {
//   late final TextEditingController password;
//   late final TextEditingController confirmPassword;
//
//   final RxBool isButtonEnabled = false.obs;
//   final RxBool isLoading = false.obs; // Loading state
//   final GetStorage storage = GetStorage();
//
//   @override
//   void onInit() {
//     password = TextEditingController();
//     password.addListener(updateButtonState);
//     confirmPassword = TextEditingController();
//     confirmPassword.addListener(updateButtonState);
//     super.onInit();
//   }
//
//   void updateButtonState() {
//     isButtonEnabled.value = _isButtonEnabled();
//   }
//
//   bool _isButtonEnabled() {
//     return password.text.isNotEmpty && confirmPassword.text.isNotEmpty;
//   }
//
//   Future<ChangePasswordResponse> updatePassword({
//     required String password,
//     required String email,
//   }) async {
//     isLoading.value = true;
//     try {
//       final resetToken = storage.read('resetToken') ??
//           ''; // Fetch the resetToken from Get Storage
//
//       final response = await Dio().patch(
//         '${ApiEndpoints.baseUrl}${ApiEndpoints.resetPasswordEndpoint}',
//         data: {
//           'email':email,
//           'password': password,
//           // 'passwordConfirm': confirmPassword,
//         },
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             // 'resetpassword': 'Bearer $resetToken' // Use the resetToken here
//           },
//         ),
//       );
//
//       if (response.data != null && response.data is Map<String, dynamic>) {
//         storage.write('token', resetToken);
//         return ChangePasswordResponse.fromJson(response.data);
//       } else {
//         throw Exception("Invalid response format");
//       }
//     } catch (e) {
//       print('--->$e');
//       // debug
//       rethrow;
//     } finally {
//       isLoading.value = false; // Set loading state to false
//     }
//   }
//
//   @override
//   void onClose() {
//     password.dispose();
//     confirmPassword.dispose();
//     super.onClose();
//   }
// }
class ChangePasswordController extends GetxController {
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  final RxBool isButtonEnabled = false.obs;
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    passwordController.addListener(updateButtonState);
    confirmPasswordController.addListener(updateButtonState);
    super.onInit();
  }

  void updateButtonState() {
    isButtonEnabled.value = passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text;
  }

  Future<void> updatePassword({
    required String password,
    required String email,
  }) async {
    isLoading.value = true;
    errorMessage.value = ''; // Reset error message before making request

    try {
      // final resetToken = storage.read('resetToken') ?? '';
      final response = await Dio().post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.resetPasswordEndpoint}',
        data: {'email': email, 'newPassword': password},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final changePassModel = ChangePasswordModel.fromJson(response.data);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', changePassModel.resetToken);
        log(changePassModel.resetToken);
        log(changePassModel.message);
      } else {
        errorMessage.value = "Failed to update password";
      }
    } catch (e) {
      if (e is DioException) {
       errorMessage.value = DioErrorHandler.handleDioError(e);
      } else {
      errorMessage.value = 'An unexpected error occurred. Please try again.';
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
