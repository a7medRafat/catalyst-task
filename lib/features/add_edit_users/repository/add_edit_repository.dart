import 'package:catalyst/core/api_services/api_services.dart';
import 'package:catalyst/core/error_handler/api_handler.dart';
import 'package:catalyst/features/users/model/UsersModel.dart';
import 'package:dio/dio.dart';

import '../model/AddEditeUserModel.dart';

class AddEditUserRepository {
  final ApiService _service = ApiServiceImpl();

  Future<String> createNewUser({required Map<String, dynamic> map}) async {
    try {
      final Response response = await _service.createNewUsers(map: map);

      if (response.statusCode == 201) {
        return response.data['message'] ?? 'User created successfully.';
      } else {
        return ApiErrorHandler.parseError(response.data);
      }
    } catch (e) {
      if (e is DioException) {
        return 'Error creating user: ${ApiErrorHandler.handleDioError(e)}';
      }
      return 'Error creating user. Please try again.';
    }
  }

  Future<AddEditeUserModel> updateUser(
      {required int id, required Map<String, dynamic> map}) async {
    try {
      final Response response = await _service.updateUser(map: map, id: id);

      if (response.statusCode == 200) {
        return AddEditeUserModel.fromJson(response.data);
      } else {
        final errorMessage = ApiErrorHandler.parseError(response.data);
        return AddEditeUserModel(
          message: errorMessage,
          user: null,
        );
      }
    } catch (e) {
      if (e is DioException) {
        return AddEditeUserModel(
          message: ApiErrorHandler.handleDioError(e),
          user: null,
        );
      } else {
        return AddEditeUserModel(
          message: 'Error updating user. Please try again.',
          user: null,
        );
      }
    }
  }

  Future<UsersModel> getUserById({required int id}) async {
    try {
      final Response response = await _service.getUserById(id: id);

      if (response.statusCode == 200) {
        return UsersModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch user: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching user: $e');
    }
  }
}
