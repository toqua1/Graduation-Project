
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/View/Auth/create_new_pass_screen.dart';
import 'package:graduation_project/core/Services/navigation_service.dart';
import '../API/endpoints.dart';
import '../core/Services/handle_dio_error.dart';

class OtpController extends GetxController {
  late final TextEditingController otpController;
  final RxBool isLoading = false.obs;
  final RxString errorMessage=''.obs;
  var shouldClearOtp = false.obs;

  @override
  void onInit() {
    otpController = TextEditingController();
    super.onInit();
  }

  Future<void> validateOtp({
    required String otp,
    required String email,
  }) async {
    isLoading.value = true;
    errorMessage.value = ''; // Reset error message before making request

    try {
      final response = await Dio().post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.checkOtpEndpoint}',
        data: {'email': email, 'resetCode': otp},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        // final resetOtpResponse = ResetOtpResponse.fromJson(response.data);
        NavigationService().replaceScreen(CreateNewPassScreen());
      } else {
        errorMessage.value='Invalid, Try again!';
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

  void setError() {
    shouldClearOtp.value = true;
  }

  void resetError() {
    errorMessage.value = '';
    shouldClearOtp.value = false; // Reset after clearing
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
