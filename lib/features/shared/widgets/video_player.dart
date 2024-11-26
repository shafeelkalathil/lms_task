import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    Key? key,
    this.isRounded = true,
    this.url = '',
  }) : super(key: key);

  final bool isRounded;
  final String url;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  FlickManager? flickManager;
  YoutubePlayerController? youtubeController;
  bool isYouTubeVideo = false;
  bool isVimeoVideo = false;

  @override
  void initState() {
    super.initState();

    // Detect YouTube or Vimeo URL
    isYouTubeVideo = YoutubePlayer.convertUrlToId(widget.url) != null;
    isVimeoVideo = widget.url.contains('vimeo.com');

    if (isYouTubeVideo) {
      // Initialize YouTube Player
      youtubeController = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    } else if (!isYouTubeVideo && !isVimeoVideo) {
      // Initialize FlickManager for regular video
      flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
          widget.url.isEmpty
              ? 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
              : widget.url,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    flickManager?.dispose();
    youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = width * 9 / 16; // Maintain 16:9 aspect ratio

        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20),
            topRight: const Radius.circular(20),
            bottomLeft: widget.isRounded ? const Radius.circular(20) : Radius.zero,
            bottomRight: widget.isRounded ? const Radius.circular(20) : Radius.zero,
          ),
          child: SizedBox(
            height: height,
            width: width,
            child: _buildVideoPlayer(),
          ),
        );
      },
    );
  }

  Widget _buildVideoPlayer() {
    if (isYouTubeVideo && youtubeController != null) {
      return YoutubePlayer(
        controller: youtubeController!,
        showVideoProgressIndicator: true,
      );
    } else if (isVimeoVideo) {
      final vimeoVideoId = widget.url.split('/').last;
      return VimeoPlayer(videoId: vimeoVideoId);
    } else if (flickManager != null) {
      return FlickVideoPlayer(
        flickManager: flickManager!,
        flickVideoWithControls: const FlickVideoWithControls(
          closedCaptionTextStyle: TextStyle(fontSize: 8),
          controls: FlickPortraitControls(),
        ),
        flickVideoWithControlsFullscreen: const FlickVideoWithControls(
          controls: FlickLandscapeControls(),
        ),
      );
    } else {
      return const Center(
        child: Text('Video could not be loaded'),
      );
    }
  }
}
