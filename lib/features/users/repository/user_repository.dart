import 'package:catalyst/core/api_services/api_services.dart';
import 'package:catalyst/features/users/model/UsersModel.dart';
import 'package:dio/dio.dart';

class UsersRepository {
  final ApiService _service = ApiServiceImpl();

  Future<List<UsersModel>> getUsers() async {
    try {
      final Response response = await _service.getAllUsers();

      if (response.statusCode == 200) {
        final List<dynamic> usersJson = response.data;
        return usersJson.map((user) => UsersModel.fromJson(user)).toList();
      } else {
        throw Exception('Failed to fetch users: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }


  Future<Response> deleteUser({required int id}) async {
    try {
      final Response response = await _service.deleteUser(id: id);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to delete Users: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error deleting user: $e');
    }
  }
}
