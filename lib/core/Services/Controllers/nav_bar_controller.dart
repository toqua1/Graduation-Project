import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NavController extends GetxController {
  final box = GetStorage(); // Storage instance
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    currentIndex.value = box.read('navIndex') ?? 0; // Load last selected index
  }

  void changeIndex(int index) {
    currentIndex.value = index;
    box.write('navIndex', index); // Save index
  }
}
