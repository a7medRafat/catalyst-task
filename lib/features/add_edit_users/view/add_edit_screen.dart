import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/config/colors/app_colors.dart';
import 'package:catalyst/config/style/icons_broken.dart';
import 'package:catalyst/core/extentions/navigation.dart';
import 'package:catalyst/core/shared_widgets/app_bar.dart';
import 'package:catalyst/core/shared_widgets/app_button.dart';
import 'package:catalyst/core/shared_widgets/loading.dart';
import 'package:catalyst/features/add_edit_users/view/widgets/create_input_fields.dart';
import 'package:catalyst/features/add_edit_users/view/widgets/profile_img.dart';
import 'package:catalyst/features/add_edit_users/view_model/add_edit_view_model.dart';
import 'package:catalyst/features/users/model/UsersModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AddEditUserScreen extends StatelessWidget {
  final bool isEdit;
  final UsersModel? userModel;

  const AddEditUserScreen({
    super.key,
    required this.isEdit,
    required this.userModel,
  });

  @override
  Widget build(BuildContext context) {
    context
        .read<AddEditViewModel>()
        .handlingUserInitialValue(isEdit, userModel);
    return Scaffold(
      appBar: MyAppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            IconBroken.Arrow___Left,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Consumer<AddEditViewModel>(
            builder:
                (BuildContext context, AddEditViewModel value, Widget? child) {
              return Form(
                key: value.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileImg(),
                    CreateInputFields(
                      emailController: value.emailController,
                      roleController: value.roleController,
                      nameController: value.nameController,
                      phoneController: value.phoneController,
                    ),
                    SizedBox(height: 20.h),
                    value.isLoading
                        ? const Loading()
                        : AppButton(
                            btnColor: Colors.lightBlue,
                            txtColor: Colors.white,
                            function: () {
                              if (value.formKey.currentState!.validate()) {
                                isEdit
                                    ? value.updateUser(context, userModel!.id!)
                                    : value.createNewUser(context);
                              }
                            },
                            text:
                                isEdit ? AppStrings.update : AppStrings.create,
                          ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
