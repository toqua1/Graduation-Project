import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class PoseService {
  final poseDetector = PoseDetector(options: PoseDetectorOptions());
  final FlutterTts flutterTts = FlutterTts();

  // Counter variables
  int direction = 0;
  int correctReps = 0;
  int incorrectReps = 0;
  double maxPercentage = 0;
  List<String> feedbackMessages = [];

  // Performance tracking
  List<Map<String, dynamic>> performanceLog = [];

  Future<void> initializeTts() async {
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future<void> speakFeedback(String message) async {
    await flutterTts.stop();
    await flutterTts.speak(message);
  }

  double degrees(double radians) {
    return radians * 180 / pi;
  }

  double calculateAngle(PoseLandmark a, PoseLandmark b, PoseLandmark c) {
    var angle = degrees(
      atan2(c.y - b.y, c.x - b.x) - atan2(a.y - b.y, a.x - b.x),
    );

    if (angle < 0) {
      angle += 360;
    }

    return angle;
  }

  double calculatePercentage(double angle) {
    // Clamp angle to valid range
    final clampedAngle = angle.clamp(20.0, 150.0);
    // Perform interpolation
    return (150 - clampedAngle) * (100) / (150 - 20);
  }

  Map<String, dynamic> checkCurlDepth(double maxPercentage) {
    if (maxPercentage <= 75) {
      return {
        'message':
            'Curl deeper: Pull your arms closer to complete the movement',
        'isCorrect': false,
      };
    } else if (maxPercentage <= 90) {
      return {
        'message': 'Curl depth: Almost there, try to curl a bit more',
        'isCorrect': false,
      };
    }
    return {'message': 'Curl depth: Good!', 'isCorrect': true};
  }

  Map<String, dynamic> checkArmPosition(double armAngle) {
    if (armAngle > 30) {
      return {
        'message': 'Arm position: Keep your arms closer to your body',
        'isCorrect': false,
      };
    }
    return {'message': 'Arm position: Good!', 'isCorrect': true};
  }

  Future<Map<String, dynamic>> processPose(InputImage inputImage) async {
    final List<Pose> poses = await poseDetector.processImage(inputImage);

    if (poses.isEmpty) {
      return {'isValid': false, 'message': 'No pose detected'};
    }

    final pose = poses.first;

    try {
      final shoulder = pose.landmarks[PoseLandmarkType.leftShoulder]!;
      final elbow = pose.landmarks[PoseLandmarkType.leftElbow]!;
      final wrist = pose.landmarks[PoseLandmarkType.leftWrist]!;
      final hip = pose.landmarks[PoseLandmarkType.leftHip]!;

      final curlAngle = calculateAngle(shoulder, elbow, wrist);
      final armAngle = calculateAngle(elbow, shoulder, hip);
      final percentage = calculatePercentage(curlAngle);

      // Rep counting logic
      String feedback = '';
      if (percentage >= 60) {
        // Going up
        if (direction == 0) {
          direction = 1;
        }
      }

      if (percentage == 0) {
        // Going down
        if (direction == 1) {
          final curlCheck = checkCurlDepth(maxPercentage);
          final armCheck = checkArmPosition(armAngle);

          feedbackMessages = [curlCheck['message'], armCheck['message']];

          List<String> repIssues = [];
          if (!curlCheck['isCorrect']) {
            repIssues.add(curlCheck['message']);
          }
          if (!armCheck['isCorrect']) {
            repIssues.add(armCheck['message']);
          }

          if (curlCheck['isCorrect'] && armCheck['isCorrect']) {
            correctReps++;
            feedback = 'Keep going';
          } else {
            incorrectReps++;
            feedback = repIssues.isNotEmpty ? repIssues.first : '';
          }

          // Log the rep performance
          performanceLog.add({
            'isCorrect': curlCheck['isCorrect'] && armCheck['isCorrect'],
            'issues': repIssues,
          });

          // Reset for next rep
          direction = 0;
          maxPercentage = 0;
        }
      }

      maxPercentage = max(percentage, maxPercentage);

      return {
        'isValid': true,
        'curlAngle': curlAngle,
        'armAngle': armAngle,
        'percentage': percentage,
        'correctReps': correctReps,
        'incorrectReps': incorrectReps,
        'feedbackMessages': feedbackMessages,
        'feedback': feedback,
        'pose': pose,
      };
    } catch (e) {
      return {'isValid': false, 'message': 'Error processing pose landmarks'};
    }
  }

  Future<void> dispose() async {
    await poseDetector.close();
  }
}
