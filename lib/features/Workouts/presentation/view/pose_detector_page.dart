
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_pose_detection/google_mlkit_pose_detection.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show WriteBuffer;

import '../../../../core/Services/pose_service.dart';

class PoseDetectorPage extends StatefulWidget {
  const PoseDetectorPage({Key? key}) : super(key: key);

  @override
  State<PoseDetectorPage> createState() => _PoseDetectorPageState();
}

class _PoseDetectorPageState extends State<PoseDetectorPage> {
  CameraController? _cameraController;
  PoseService? _poseService;
  bool _isPermissionGranted = false;
  bool _isProcessing = false;
  Map<String, dynamic>? _poseData;

  @override
  void initState() {
    super.initState();
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    _poseService = PoseService();
    await _poseService?.initializeTts();
    await _requestCameraPermission();
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    setState(() {
      _isPermissionGranted = status == PermissionStatus.granted;
    });
    if (_isPermissionGranted) {
      _initializeCamera();
    }
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final camera = cameras.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    // Configure based on platform:
    // Android -> nv21, iOS -> bgra8888
    _cameraController = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );

    try {
      await _cameraController!.initialize();
      await _cameraController!.startImageStream(_processCameraImage);
      if (mounted) setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  Future<void> _processCameraImage(CameraImage image) async {
    if (_isProcessing) return;
    _isProcessing = true;

    try {
      // Concatenate image planes to create a single byte buffer.
      final allBytes = WriteBuffer();
      for (final Plane plane in image.planes) {
        allBytes.putUint8List(plane.bytes);
      }
      final bytes = allBytes.done().buffer.asUint8List();

      final Size imageSize = Size(
        image.width.toDouble(),
        image.height.toDouble(),
      );

      // Use the sensor orientation directly.
      final InputImageRotation imageRotation = InputImageRotation.values.firstWhere(
            (element) =>
        element.rawValue == _cameraController!.description.sensorOrientation,
      );

      // Set input image format based on platform.
      final InputImageFormat inputImageFormat = Platform.isAndroid
          ? InputImageFormat.nv21
          : InputImageFormat.bgra8888;

      final InputImageMetadata metadata = InputImageMetadata(
        size: imageSize,
        rotation: imageRotation,
        format: inputImageFormat,
        bytesPerRow: image.planes[0].bytesPerRow,
      );

      final inputImage = InputImage.fromBytes(bytes: bytes, metadata: metadata);

      final poseData = await _poseService?.processPose(inputImage);

      if (poseData != null && poseData['isValid'] && mounted) {
        setState(() {
          _poseData = poseData;
        });

        // Handle TTS feedback if available.
        if (poseData['feedback'] != null && poseData['feedback'].isNotEmpty) {
          _poseService?.speakFeedback(poseData['feedback']);
        }
      }
    } catch (e) {
      print('Error processing camera image: $e');
    }

    _isProcessing = false;
  }

  Widget _buildPoseOverlay() {
    if (_poseData == null || !_poseData!['isValid']) {
      return Container();
    }

    return CustomPaint(
      painter: PosePainter(
        pose: _poseData!['pose'],
        curlAngle: _poseData!['curlAngle'],
        armAngle: _poseData!['armAngle'],
        percentage: _poseData!['percentage'],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bicep Curl Tracker')),
      body: _isPermissionGranted
          ? Stack(
        fit: StackFit.expand,
        children: [
          _cameraController?.value.isInitialized == true
              ? CameraPreview(_cameraController!)
              : const Center(child: CircularProgressIndicator()),
          _buildPoseOverlay(),
          if (_poseData != null && _poseData!['isValid'])
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Correct Reps: ${_poseData!['correctReps']}',
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Incorrect Reps: ${_poseData!['incorrectReps']}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Curl: ${_poseData!['percentage'].toInt()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ..._poseData!['feedbackMessages']
                        .map<Widget>(
                          (message) => Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    )
                        .toList(),
                  ],
                ),
              ),
            ),
        ],
      )
          : const Center(child: Text('Camera permission not granted')),
    );
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _poseService?.dispose();
    super.dispose();
  }
}

class PosePainter extends CustomPainter {
  final Pose pose;
  final double curlAngle;
  final double armAngle;
  final double percentage;

  PosePainter({
    required this.pose,
    required this.curlAngle,
    required this.armAngle,
    required this.percentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.blue;

    final dotPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;

    // Draw the pose landmarks.
    pose.landmarks.forEach((_, landmark) {
      canvas.drawCircle(
        Offset(landmark.x * size.width, landmark.y * size.height),
        4,
        dotPaint,
      );
    });

    // Helper function to draw connections.
    void drawConnection(PoseLandmarkType from, PoseLandmarkType to) {
      final fromLandmark = pose.landmarks[from];
      final toLandmark = pose.landmarks[to];

      if (fromLandmark != null && toLandmark != null) {
        canvas.drawLine(
          Offset(fromLandmark.x * size.width, fromLandmark.y * size.height),
          Offset(toLandmark.x * size.width, toLandmark.y * size.height),
          paint,
        );
      }
    }

    // Draw essential connections for arm tracking.
    drawConnection(PoseLandmarkType.leftShoulder, PoseLandmarkType.leftElbow);
    drawConnection(PoseLandmarkType.leftElbow, PoseLandmarkType.leftWrist);
    drawConnection(PoseLandmarkType.leftShoulder, PoseLandmarkType.leftHip);

    // Draw angles near joints.
    final textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 16,
      backgroundColor: Colors.black54,
    );
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(text: 'Curl: ${curlAngle.toInt()}°', style: textStyle),
    );

    // Draw curl angle near elbow.
    final elbow = pose.landmarks[PoseLandmarkType.leftElbow];
    if (elbow != null) {
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(elbow.x * size.width + 10, elbow.y * size.height + 10),
      );
    }

    // Draw arm angle near shoulder.
    final shoulder = pose.landmarks[PoseLandmarkType.leftShoulder];
    if (shoulder != null) {
      textPainter.text = TextSpan(
        text: 'Arm: ${armAngle.toInt()}°',
        style: textStyle,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(shoulder.x * size.width + 10, shoulder.y * size.height + 10),
      );
    }
  }

  @override
  bool shouldRepaint(PosePainter oldDelegate) {
    return oldDelegate.curlAngle != curlAngle ||
        oldDelegate.armAngle != armAngle ||
        oldDelegate.percentage != percentage;
  }
}
