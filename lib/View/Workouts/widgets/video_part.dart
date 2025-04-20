// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class ExerciseVideoWidget extends StatefulWidget {
//   final String videoUrl;
//   const ExerciseVideoWidget({Key? key, required this.videoUrl}) : super(key: key);
//
//   @override
//   _ExerciseVideoWidgetState createState() => _ExerciseVideoWidgetState();
// }
//
// class _ExerciseVideoWidgetState extends State<ExerciseVideoWidget> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {}); // Update UI when the video is loaded
//         _controller.play();
//         _controller.setLooping(true);
//       });
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (!_controller.value.isInitialized) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return AspectRatio(
//       aspectRatio: _controller.value.aspectRatio,
//       child: VideoPlayer(_controller),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class ExerciseVideoWidget extends StatefulWidget {
  final String videoUrl;
  const ExerciseVideoWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _ExerciseVideoWidgetState createState() => _ExerciseVideoWidgetState();
}

class _ExerciseVideoWidgetState extends State<ExerciseVideoWidget> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);

    try {
      await _videoPlayerController.initialize();
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
        aspectRatio: _videoPlayerController.value.aspectRatio,
        placeholder: Center(child: CircularProgressIndicator()),
        autoInitialize: true,
      );
      setState(() {});
    } catch (e) {
      print("Error initializing video: $e");
      // Handle error, e.g., show an error message to the user
    }
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_chewieController == null || !_videoPlayerController.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: Chewie(controller: _chewieController!),
    );
  }
}