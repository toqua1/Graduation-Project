import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduation_project/API/endpoints.dart';
import '../Models/workout_model.dart';

class WorkoutController extends GetxController {
  var workouts = <WorkoutModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchWorkouts();
    super.onInit();
  }

  Future<void> fetchWorkouts() async {
    try {
      isLoading(true);
      var response = await Dio().get(
          '${ApiEndpoints.baseUrl}${ApiEndpoints.allWorkoutsEndpoint}');

      if (response.statusCode == 200) {
        workouts.value =
            workoutModelFromJson(response.data);
      }
    } catch (e) {
      print("Error fetching workouts: $e");
    } finally {
      isLoading(false);
    }
  }
}