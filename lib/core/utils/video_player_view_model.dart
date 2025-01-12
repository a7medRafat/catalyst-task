import 'dart:io';

import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerViewModel extends ChangeNotifier {
  static VideoPlayerController? _sharedVideoPlayerController;

  VideoPlayerController? get videoPlayerController =>
      _sharedVideoPlayerController;

  Future<void> initializeVideo({
    String? videoUrl,
    File? videoFile,
  }) async {
    if (_sharedVideoPlayerController != null) return;

    if (videoUrl != null) {
      _sharedVideoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(AppStrings.introVideo));
    } else if (videoFile != null) {
      _sharedVideoPlayerController = VideoPlayerController.file(videoFile);
    }

    try {
      await _sharedVideoPlayerController?.initialize();
    } catch (error) {
      debugPrint("Error initializing video: $error");
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _sharedVideoPlayerController?.dispose();
    _sharedVideoPlayerController = null;
    super.dispose();
  }
}
