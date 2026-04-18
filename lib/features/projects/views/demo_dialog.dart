import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DemoDialog extends StatefulWidget {
  final String assetUrl;

  const DemoDialog({super.key, required this.assetUrl});

  @override
  State<DemoDialog> createState() => _DemoDialogState();
}

class _DemoDialogState extends State<DemoDialog> {
  late VideoPlayerController _controller;
  bool _isFastForwarding = false;
  bool _isSlowMotion = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetUrl)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  void _handleLongPressStart(LongPressStartDetails details, BoxConstraints constraints) {
    final double halfWidth = constraints.maxWidth / 2;
    if (details.localPosition.dx > halfWidth) {
      _controller.setPlaybackSpeed(2.0);
      setState(() {
        _isFastForwarding = true;
      });
    } else {
      _controller.setPlaybackSpeed(0.5);
      setState(() {
        _isSlowMotion = true;
      });
    }
  }

  void _handleLongPressEnd(LongPressEndDetails details) {
    _controller.setPlaybackSpeed(1.0);
    setState(() {
      _isFastForwarding = false;
      _isSlowMotion = false;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(4),
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: _controller.value.isInitialized
                ? LayoutBuilder(
                    builder: (context, constraints) {
                      return GestureDetector(
                        onLongPressStart: (details) => _handleLongPressStart(details, constraints),
                        onLongPressEnd: _handleLongPressEnd,
                        onDoubleTap: () {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        },
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            AspectRatio(
                              aspectRatio: _controller.value.aspectRatio,
                              child: VideoPlayer(_controller),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ValueListenableBuilder<VideoPlayerValue>(
                                  valueListenable: _controller,
                                  builder: (context, value, child) {
                                    return SliderTheme(
                                      data: SliderTheme.of(context).copyWith(
                                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6.0),
                                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 14.0),
                                      ),
                                      child: Slider(
                                        value: value.position.inMilliseconds.toDouble().clamp(0.0, value.duration.inMilliseconds.toDouble()),
                                        min: 0.0,
                                        max: value.duration.inMilliseconds.toDouble(),
                                        onChanged: (newValue) {
                                          _controller.seekTo(Duration(milliseconds: newValue.toInt()));
                                        },
                                        activeColor: Colors.blueAccent,
                                        inactiveColor: Colors.white24,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            if (_isFastForwarding)
                              Positioned(
                                top: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('2x Speed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                      Icon(Icons.fast_forward, color: Colors.white, size: 18),
                                    ],
                                  ),
                                ),
                              ),
                            if (_isSlowMotion)
                              Positioned(
                                top: 20,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.fast_rewind, color: Colors.white, size: 18),
                                      Text('0.5x Speed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  )
                : const Padding(
                    padding: EdgeInsets.all(50.0),
                    child: CircularProgressIndicator(),
                  ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
