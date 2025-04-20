import 'package:get/get.dart';

class SetUpController extends GetxController{

  RxString selectedGoal = ''.obs;
  RxString selectedLevel = ''.obs;
  RxInt selectedAge = 0.obs ;
  RxString selectedGender=''.obs;
  RxDouble selectedHeight=0.0.obs;
  RxDouble selectedWeight=0.0.obs;

  void setLevel(String level) {
    selectedLevel.value = level;
  }

  void selectGoal(String goal) {
    selectedGoal.value = goal;
  }

  void selectGender(String gender) {
    selectedGender.value = gender;
  }

  void selectAge(int age) {
    selectedAge.value = age;
  }

  void selectHeight(double height) {
    selectedHeight.value = height;
  }

  void selectWeight(double weight) {
    selectedWeight.value = weight;
  }
}