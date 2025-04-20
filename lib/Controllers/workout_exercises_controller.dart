import 'package:get/get.dart';
import 'package:graduation_project/API/api_helper.dart';
import 'package:graduation_project/Models/exercise_model.dart';

class WorkoutExercisesController extends GetxController {
  final ApiData _apiData = ApiData();
  var exercises = <Exercise>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void fetchExercises(String workoutId) async {
    try {
      isLoading(true);
      errorMessage('');
      List<Exercise> fetchedExercises =
      await _apiData.fetchExercisesForWorkout(workoutId);
      exercises.assignAll(fetchedExercises);
    } catch (e) {
      errorMessage(e.toString());
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
