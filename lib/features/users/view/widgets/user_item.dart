import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/config/style/icons_broken.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:catalyst/features/users/view/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class UserItem extends StatelessWidget {
  final String name;
  final String role;
  final String? img;
  final Color roleColor;
  final dynamic id;
  final Function(BuildContext) deleteFun;
  final Function()? function;

  const UserItem({
    super.key,
    required this.name,
    required this.role,
    this.img,
    required this.roleColor,
    required this.id,
    required this.deleteFun,
    this.function,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => deleteFun(context),
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(32.0),
            foregroundColor: Colors.white,
            icon: IconBroken.Delete,
            label: AppStrings.delete,
          ),
        ],
      ),
      child: AppContainer(
        function: function,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.only(bottom: 6.0),
        borderRadius: BorderRadius.circular(32.0),
        color: AppColors.lightBlue.withOpacity(0.8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImage(
              img: img,
              circleColor: roleColor,
            ),
            const SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: AppFonts.bodyText1),
                Text(
                  role,
                  style: AppFonts.bodyText3.copyWith(color: roleColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
