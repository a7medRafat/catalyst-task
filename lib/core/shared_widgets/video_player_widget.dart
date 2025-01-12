import 'dart:io';
import 'package:catalyst/core/shared_widgets/loading.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../utils/video_player_view_model.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String? videoUrl;
  final File? videoFile;

  const VideoPlayerWidget({
    super.key,
    this.videoUrl,
    this.videoFile,
  }) : assert(videoUrl != null || videoFile != null,
            'Either videoUrl or videoFile must be provided');

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoPlayerViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.videoPlayerController == null) {
          return const Loading();
        }
        return AspectRatio(
          aspectRatio: viewModel.videoPlayerController!.value.aspectRatio,
          child: Chewie(
            controller: ChewieController(
              videoPlayerController: viewModel.videoPlayerController!,
              autoPlay: false,
              looping: false,
            ),
          ),
        );
      },
    );
  }
}
