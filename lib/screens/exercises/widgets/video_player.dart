import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoAssetPath;
  const VideoPlayerScreen({super.key, required this.videoAssetPath});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(widget.videoAssetPath);

    chewieController = ChewieController(
        autoPlay: true,
        showControls: true,
        videoPlayerController: videoPlayerController,
        aspectRatio: 16 / 9);
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
            aspectRatio: 16 / 9, child: Chewie(controller: chewieController)),
      ),
    );
  }
}
