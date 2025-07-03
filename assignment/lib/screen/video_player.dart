import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// A reusable video player widget that plays an asset video,
/// with tap-to-play/pause functionality.
class VideoPlayerWidget extends StatefulWidget {
  /// The _asset_ path of the video to play.
  /// e.g. "assets/videos/my_video.mp4"
  final String assetPath;

  const VideoPlayerWidget({
    Key? key,
    required this.assetPath,
  }) : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    // ← here’s the only change: use `.asset(...)`
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {});        // rebuild to show the first frame
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying ? _controller.pause() : _controller.play();
          _isPlaying = _controller.value.isPlaying;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          if (!_isPlaying)
            const Icon(
              Icons.play_arrow,
              size: 64,
              color: Colors.white70,
            ),
        ],
      ),
    );
  }
}
