import 'package:dio/dio.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../API/endpoints.dart';
import '../core/Services/email_validation.dart';
import '../core/Services/handle_dio_error.dart';

class ForgetPassController extends GetxController {
  late final TextEditingController emailController;
  final RxBool isLoading = false.obs;
  final RxBool isResend = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isSuccess = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  Future<void> validateAndSendResetCode(String email ,BuildContext context)
  async {
    // // Step 1: Validate email format
    // if (!isValidEmail(email.trim())) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text("Invalid Email. Please enter a valid email "
    //   "address")),
    //   );
    //   return;
    // }

    isLoading.value = true;
    errorMessage.value = ''; // Reset error message before making request

    try {
      final response = await Dio().post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.forgetPasswordEndpoint}',
        data: {'email': email},
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200 && response.data != null) {
        errorMessage.value = '';
        isSuccess.value =true ;
      } else {
        errorMessage.value = 'Invalid, Try again!';
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
    super.onClose();
    emailController.dispose();
  }
}
