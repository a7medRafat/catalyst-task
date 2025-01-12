import 'package:catalyst/core/shared_widgets/toast.dart';
import 'package:catalyst/features/users/model/UsersModel.dart';
import 'package:catalyst/features/users/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class UsersViewModel extends ChangeNotifier {
  final UsersRepository _repository = UsersRepository();
  List<UsersModel> users = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  final PagingController<int, UsersModel> pagingController =
      PagingController(firstPageKey: 1);

  void _updateLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  UsersViewModel() {
    pagingController.addPageRequestListener((pageKey) {
      getAllUsers();
    });
  }

  Future<void> getAllUsers() async {
    _updateLoading(true);
    try {
      users = await _repository.getUsers();

      _updateLoading(false);
      notifyListeners();
    } catch (e) {
      pagingController.error = e;
      _updateLoading(false);
    }
  }

  Future<void> deleteUser(int userId, BuildContext context) async {
    try {
      final response = await _repository.deleteUser(id: userId);

      final successMessage =
          response.data['message'] ?? 'User deleted successfully!';

      MyToast.show(text: successMessage);

      await getAllUsers();

      if (context.mounted) {
        Navigator.of(context).pop();
      }

      notifyListeners();
    } catch (e) {
      if (context.mounted) {
        MyToast.show(
          text: 'Failed to delete user: ${e.toString()}',
          context: context,
        );
      }
    }
  }
}
