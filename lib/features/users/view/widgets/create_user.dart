import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/app_fonts.dart';
import 'package:catalyst/config/style/icons_broken.dart';
import 'package:catalyst/core/extentions/navigation.dart';
import 'package:catalyst/core/utils/titles.dart';
import 'package:catalyst/core/utils/vContainer.dart';
import 'package:catalyst/features/add_edit_users/view/add_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateUser extends StatelessWidget {
  const CreateUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppTitle(text: 'All users'),
          AppContainer(
            function: () => context.go(
                screen: const AddEditUserScreen(
              isEdit: false,
              userModel: null,
            )),
            padding: const EdgeInsets.all(10),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightBlue,
            child: Row(
              children: [
                const Icon(IconBroken.Add_User),
                SizedBox(width: 5.sp),
                Text('Create User', style: AppFonts.bodyText6),
              ],
            ),
          )
        ],
      ),
    );
  }
}
