import 'package:get/get.dart';
import '../API/api_helper.dart';

class LoginController extends GetxController {
  final ApiData _apiData = ApiData();
  var isLoading = false.obs;
  var loginSuccess = false.obs;
  var errorMessage = ''.obs;

  Future<void> loginUser(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      bool success = await _apiData.loginUser(email, password);

      if (success) {
        loginSuccess.value = true;
      } else {
        errorMessage.value = 'Login failed';
        loginSuccess.value = false;
      }
    } catch (e) {
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      loginSuccess.value = false;
    } finally {
      isLoading.value = false;
    }
  }
}