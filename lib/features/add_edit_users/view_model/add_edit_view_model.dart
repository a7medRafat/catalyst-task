import 'package:catalyst/config/Strings/app_strings.dart';
import 'package:catalyst/core/extentions/navigation.dart';
import 'package:catalyst/core/shared_widgets/toast.dart';
import 'package:catalyst/features/add_edit_users/model/AddEditeUserModel.dart';
import 'package:catalyst/features/add_edit_users/repository/add_edit_repository.dart';
import 'package:catalyst/features/users/model/UsersModel.dart';
import 'package:catalyst/features/users/view_model/users_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class AddEditViewModel extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UsersModel? currentUser;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  final AddEditUserRepository _repository = AddEditUserRepository();

  bool isLoading = false;

  _updateLoadingState(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> createNewUser(BuildContext context) async {
    _updateLoadingState(true);
    try {
      final map = UsersModel().toJson(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        role: roleController.text,
        profileImage: AppStrings.defaultProfile,
        introVideo: AppStrings.introVideo,

      );

      String responseMessage = await _repository.createNewUser(map: map);

      MyToast.show(text: responseMessage);

      if (responseMessage == 'User created successfully.') {
        await context.read<UsersViewModel>().getAllUsers();

        if (context.mounted) {
          context.pop();
          clearValues();
        }
      }
    } catch (e) {
      debugPrint("Error creating user: $e");
      MyToast.show(
        text: 'An unexpected error occurred. Please try again.',
      );
      rethrow;
    } finally {
      _updateLoadingState(false);
    }
  }

  Future<void> updateUser(BuildContext context, int userId) async {
    _updateLoadingState(true);

    try {
      UsersModel currentUser = await _repository.getUserById(id: userId);

      final Map<String, dynamic> updatedFields = {
        if (nameController.text.isNotEmpty &&
            nameController.text != currentUser.name)
          AppStrings.name: nameController.text,
        if (emailController.text.isNotEmpty &&
            emailController.text != currentUser.email)
          AppStrings.email: emailController.text,
        if (phoneController.text.isNotEmpty &&
            phoneController.text != currentUser.phone)
          AppStrings.phone: phoneController.text,
        if (roleController.text.isNotEmpty &&
            roleController.text != currentUser.role)
          AppStrings.role: roleController.text,
      };

      if (updatedFields.isEmpty) {
        MyToast.show(text: 'No changes to update.');
        return;
      }
      final userResponse = await _repository.updateUser(
        id: userId,
        map: updatedFields,
      );

      MyToast.show(text: userResponse.message!);
      if (context.mounted) {
        context.pop();
      }

      await context.read<UsersViewModel>().getAllUsers();
    } catch (e) {
      String errorMessage = 'An unexpected error occurred.';

      if (e is AddEditeUserModel) {
        errorMessage = e.message ?? 'Failed to update user.';
      }

      MyToast.show(text: errorMessage);

      rethrow;
    } finally {
      _updateLoadingState(false);
    }
  }

  Future<void> getUserById(BuildContext context, int userId) async {
    try {
      currentUser = await _repository.getUserById(id: userId);
    } catch (e) {
      String errorMessage = 'An unexpected error occurred.';

      if (e is AddEditeUserModel) {
        errorMessage = e.message ?? 'Failed to get user.';
      }

      MyToast.show(text: errorMessage);

      rethrow;
    } finally {
      _updateLoadingState(false);
    }
  }

  clearValues() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    roleController.clear();
  }

  handlingUserInitialValue(bool isEdit, UsersModel? model) {
    nameController.text = isEdit ? model!.name! : nameController.text;
    emailController.text = isEdit ? model!.email! : nameController.text;
    phoneController.text = isEdit ? model!.phone! : nameController.text;
    roleController.text = isEdit ? model!.role! : nameController.text;
  }
}
