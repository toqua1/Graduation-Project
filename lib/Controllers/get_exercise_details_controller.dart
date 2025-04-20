// import 'package:get/get.dart';
// import 'package:dio/dio.dart';
// import '../Models/exercise_model.dart';
// import '../API/endpoints.dart';
//
// class ExerciseDetailsController extends GetxController {
//   var exercise = Rxn<Exercise>(); // Holds a single exercise object
//   var isLoading = true.obs;
//
//   final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));
//
//   Future<void> fetchExerciseDetails(String exerciseId) async {
//     try {
//       isLoading(true);
//       final response = await _dio.get("${ApiEndpoints.exerciseEndpoint}$exerciseId");
//
//       if (response.statusCode == 200 && response.data["success"] == true) {
//         final data = response.data["data"];
//         exercise.value = Exercise.fromJson(data);
//       } else {
//         Get.snackbar("Error", "Failed to fetch exercise details");
//       }
//     } catch (e) {
//       Get.snackbar("Error", "Error fetching exercise: $e");
//     } finally {
//       isLoading(false);
//     }
//   }
// }
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:video_player/video_player.dart';
import '../Models/exercise_model.dart';
import '../API/endpoints.dart';

class ExerciseDetailsController extends GetxController {
  var exercise = Rxn<Exercise>(); // Holds a single exercise object
  var isLoading = true.obs;
  RxBool isPlaying = false.obs;
  VideoPlayerController? videoController; // Single controller instance

  Future<void> initializeVideo(String videoUrl) async {
    try {
      // Dispose previous controller if exists
      await videoController?.dispose();

      videoController = VideoPlayerController.network(videoUrl)
        ..initialize().then((_) {
          videoController!.setLooping(true);
          videoController!.play();
          isPlaying.value = true;
          update(); // Not needed for Obx, but if using GetBuilder, call update().
        });
    } catch (e) {
      Get.snackbar("Video Error", "Failed to initialize video: $e");
    }
  }

  void playVideo() {
    if (videoController != null && videoController!.value.isInitialized) {
      videoController!.play();
      isPlaying.value = true;
    }
  }

  void pauseVideo() {
    if (videoController != null && videoController!.value.isInitialized) {
      videoController!.pause();
      isPlaying.value = false;
    }
  }

  @override
  void onClose() {
    videoController?.dispose();
    super.onClose();
  }

  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl));

  Future<void> fetchExerciseDetails(String exerciseId) async {
    try {
      isLoading(true);
      final response = await _dio.get("${ApiEndpoints.exerciseEndpoint}$exerciseId");

      if (response.statusCode == 200 && response.data["success"] == true) {
        final data = response.data["data"];
        exercise.value = Exercise.fromJson(data);

        // Initialize video using the first video URL if available.
        if (exercise.value != null && exercise.value!.videoUrl.isNotEmpty) {
          await initializeVideo(exercise.value!.videoUrl.first);
        }
      } else {
        // Get.snackbar("Error", "Failed to fetch exercise details");
      }
    } catch (e) {
      // Get.snackbar("Error", "Error fetching exercise: $e");
    } finally {
      isLoading(false);
    }
  }
}
