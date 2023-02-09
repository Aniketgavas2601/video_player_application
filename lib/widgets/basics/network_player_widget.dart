import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_application/main.dart';
import 'package:video_player_application/widgets/other/floating_action_button_widget.dart';
import 'package:video_player_application/widgets/other/text_field_widget.dart';
import 'package:video_player_application/widgets/video_player_widget.dart';


class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({Key? key}) : super(key: key);

  @override
  State<NetworkPlayerWidget> createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  final textController = TextEditingController(text: urlLandscapeVideo);
  VideoPlayerController? controller;


  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(textController.text)
    ..addListener(() => setState(() {}))
    ..setLooping(true)
    ..initialize().then((value) => controller!.play());
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          VideoPlayerWidget(controller: controller),
          buildTextField()
        ],
      ),
    );
  }

  Widget buildTextField() => Container(
    padding: EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(child: TextFieldWidget(controller: textController, hintText: 'Enter Video Url')),
        SizedBox(width: 12,),
        FloatingActionButtonWidget(onPressed: (){
          if(textController.text.trim().isEmpty) return;
          controller = VideoPlayerController.network(textController.text)
            ..addListener(() => setState(() {}))
            ..setLooping(true)
            ..initialize().then((value) => controller!.play());
        },)
      ],
    ),
  );
}
