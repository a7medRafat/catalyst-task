import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/core/shared_widgets/video_player_widget.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:catalyst/features/users/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroVideo extends StatelessWidget {
  const IntroVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Consumer<UsersViewModel>(
        builder: (BuildContext context, UsersViewModel value, Widget? child) {
          return AppContainer(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: VideoPlayerWidget(
                  videoUrl: AppStrings.introVideo,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
