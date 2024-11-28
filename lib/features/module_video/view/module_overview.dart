import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lms_task/core/utils/extension/size_extension.dart';
import 'package:lms_task/features/shared/widgets/app_bar.dart';

import '../../../core/constants/color_constants.dart';
import '../../../core/utils/styles/text_style.dart';
import '../../shared/widgets/video_player.dart';


@RoutePage()
class ModuleOverViewScreen extends StatelessWidget {
  const ModuleOverViewScreen({super.key, required this.title, required this.description, required this.videoUrl, required this.videoType});
  final String title;
  final String description;
  final String videoUrl;
  final String videoType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: ''),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.screenWidth*0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomVideoPlayer(
                  videoUrl: videoUrl,
                  videoType: videoType,
                ),
                const SizedBox(height: 20,),
                Text(
                  title,
                  style: subtitle1.copyWith(color: silverChalice.shade900),
                ),
                const SizedBox(height: 10,),
                Text(
                  description,
                  style: subtitle2.copyWith(color: silverChalice.shade500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
