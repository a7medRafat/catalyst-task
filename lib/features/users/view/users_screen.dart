import 'package:catalyst/core/enums/app_enum.dart';
import 'package:catalyst/core/extentions/navigation.dart';
import 'package:catalyst/core/shared_widgets/loading.dart';
import 'package:catalyst/features/add_edit_users/view/add_edit_screen.dart';
import 'package:catalyst/features/users/view/widgets/create_user.dart';
import 'package:catalyst/features/users/view/widgets/intro_video.dart';
import 'package:catalyst/features/users/view/widgets/user_item.dart';
import 'package:catalyst/features/users/view_model/users_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersViewModel usersViewModel = context.watch<UsersViewModel>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const IntroVideo(),
              const CreateUser(),
              usersViewModel.isLoading
                  ? const Loading()
                  : Consumer<UsersViewModel>(
                      builder: (BuildContext context, UsersViewModel value,
                          Widget? child) {
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final user = value.users[index];
                            final roleEnum = user.role != null
                                ? mapRoleStringToEnum(user.role!)
                                : RoleEnum.client;

                            return UserItem(
                              name: user.name ?? '',
                              role: user.role ?? '',
                              img: user.profileImage ?? '',
                              roleColor: roleEnum.getRoleColor(context),
                              id: user.id ?? 0,
                              function: () => context.go(
                                screen: AddEditUserScreen(
                                  isEdit: true,
                                  userModel: user,
                                ),
                              ),
                              deleteFun: (context) =>
                                  usersViewModel.deleteUser(user.id!, context),
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 3.h,
                          ),
                          itemCount: value.users.length,
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
