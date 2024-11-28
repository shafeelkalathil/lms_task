
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';

class CustomVideoPlayer extends StatelessWidget {
  final String videoUrl;
  final String videoType;

  const CustomVideoPlayer({Key? key, required this.videoUrl, required this.videoType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadiusDirectional.circular(20),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: buildVideoPlayer(),
      ),
    );
  }

  Widget buildVideoPlayer() {
    if (videoType.toLowerCase() == 'youtube') {
      return YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
      );
    } else if (videoType.toLowerCase() == 'vimeo') {
      return VimeoVideoPlayer(
        // url: videoUrl,
        url : 'https://player.vimeo.com/video/76979871',
        autoPlay: true,
        dioOptionsForVimeoVideoConfig: Options(),
      );
    } else {
      return const Center(
        child: Text('Unsupported video type'),
      );
    }
  }
}

