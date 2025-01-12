import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/config/style/icons_broken.dart';
import 'package:catalyst/core/enums/app_enum.dart';
import 'package:catalyst/core/shared_widgets/custom_dropdown.dart';
import 'package:catalyst/core/utils/default_text_field.dart';
import 'package:flutter/material.dart';

class CreateInputFields extends StatelessWidget {
  const CreateInputFields({
    super.key,
    required this.emailController,
    required this.roleController,
    required this.nameController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController roleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultField(
            prefixIcon: const Icon(IconBroken.Profile),
            controller: nameController,
            hint: AppStrings.name,
            borderRadius: BorderRadius.circular(15),
            isPassword: false,
            textInputType: TextInputType.name,
            validation: (value) {
              if (value.isEmpty) {
                return AppStrings.validateName;
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
            prefixIcon: const Icon(IconBroken.Message),
            controller: emailController,
            borderRadius: BorderRadius.circular(15),
            hint: AppStrings.email,
            isPassword: false,
            textInputType: TextInputType.emailAddress,
            validation: (value) {
              if (value.isEmpty) {
                return AppStrings.validateEmail;
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
            prefixIcon: const Icon(IconBroken.Call),
            controller: phoneController,
            hint: AppStrings.phone,
            borderRadius: BorderRadius.circular(15),
            isPassword: false,
            textInputType: TextInputType.phone,
            validation: (value) {
              if (value.isEmpty) {
                return AppStrings.validatePhone;
              }
            }),
        const SizedBox(height: 15),
        CustomDropdown<RoleEnum>(
          hintText: 'Select role',
          items: RoleEnum.values,
          value: RoleEnum.values.firstWhere(
            (role) => role.toShortString() == roleController.text,
            orElse: () => RoleEnum.values.first,
          ),
          text: (role) => Text(
            role.toShortString(),
          ),
          onChanged: (selectedRole) {
            roleController.text = selectedRole!.toShortString();
          },
        )
      ],
    );
  }
}
