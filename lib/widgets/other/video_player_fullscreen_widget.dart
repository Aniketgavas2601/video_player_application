import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_application/widgets/basic_overlay_widget.dart';

class VideoPlayerFullscreenWidget extends StatelessWidget {
  VideoPlayerController? controller;

  VideoPlayerFullscreenWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) =>
      controller != null && controller!.value.isInitialized
          ? Container(
              alignment: Alignment.topCenter,
              child: buildVideo(),
            )
          : Center(
              child: CircularProgressIndicator(),
            );

  Widget buildVideo() => Stack(
      fit: StackFit.expand,
      children: <Widget>[
        buildVideoPlayer(),
        BasicOverlayWidget(controller: controller!)
      ]);

  Widget buildVideoPlayer() => AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: VideoPlayer(controller!),
      );
}
