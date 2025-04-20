import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Controllers/setup_controller.dart';
import '../API/api_helper.dart';
import '../Models/signup_model.dart';

class SignUpController extends GetxController {
  final ApiData _apiData = ApiData();
  var isLoading = false.obs;
  var signUpSuccess = false.obs;
  var errorMessage = ''.obs;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  SetUpController setUpController =Get.put(SetUpController());

  Future<void> signUpUser() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final signUpData = SignUpModel(
          name: nameController.text,
          email: emailController.text,
          password: passwordController.text,
          gender: setUpController.selectedGender.value,
          age: setUpController.selectedAge.value,
          weight: setUpController.selectedWeight.value,
          height: setUpController.selectedHeight.value,
          fitnessGoal: setUpController.selectedGoal.value,
          activityLevel: setUpController.selectedLevel.value
      );
      bool success = await _apiData.signUpUser(signUpData);
      if (success) {
        signUpSuccess.value = true;
      } else {
        errorMessage.value = 'Sign-up failed. Please try again.';
        signUpSuccess.value = false;
      }
    } catch (e) {
      errorMessage.value = e.toString().replaceFirst('Exception: ', '');
      signUpSuccess.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
