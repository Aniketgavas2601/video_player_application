import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_application/main.dart';
import 'package:video_player_application/widgets/other/video_player_fullscreen_widget.dart';

class PortraitPlayerWidget extends StatefulWidget {
  const PortraitPlayerWidget({Key? key}) : super(key: key);

  @override
  State<PortraitPlayerWidget> createState() => _PortraitPlayerWidgetState();
}

class _PortraitPlayerWidgetState extends State<PortraitPlayerWidget> {

  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(urlPortraitVideo)
    ..addListener(() => setState(() {}))
    ..setLooping(true)
    ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerFullscreenWidget(controller: controller,);
  }
}
