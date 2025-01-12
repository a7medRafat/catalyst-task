import 'package:catalyst/core/dio_helper/dio_helper.dart';
import 'package:catalyst/core/end_points/end_points.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

abstract class ApiService {
  Future<Response> getAllUsers();

  Future<Response> getUserById({required int id});

  Future<Response> createNewUsers({required Map<String, dynamic> map});

  Future<Response> deleteUser({required int id});

  Future<Response> updateUser(
      {required int id, required Map<String, dynamic> map});

  Future<Response> getAllProperties();

  Future<Response> getAllBookings();
}

class ApiServiceImpl implements ApiService {
  @override
  Future<Response> getAllUsers() async {
    final response = await DioHelper.getData(
      url: EndPoints.users,
    );
    return response;
  }

  @override
  Future<Response> getUserById({required int id}) async {
    final response = await DioHelper.getData(
      url: '${EndPoints.users}/$id',
    );
    return response;
  }

  @override
  Future<Response> createNewUsers({required Map<String, dynamic> map}) async {
    try {
      return await DioHelper.postData(
        url: EndPoints.users,
        data: map,
      );
    } catch (e) {
      debugPrint('Error in createNewUsers: $e');
      rethrow;
    }
  }

  @override
  Future<Response> deleteUser({required int id}) async {
    try {
      final response = await DioHelper.deleteData(
        url: '${EndPoints.users}/$id',
      );
      return response;
    } catch (e) {
      debugPrint('Error in deleting user: $e');
      rethrow;
    }
  }

  @override
  Future<Response> updateUser(
      {required int id, required Map<String, dynamic> map}) async {
    try {
      final response =
          await DioHelper.postData(url: '${EndPoints.users}/$id', data: map);
      return response;
    } catch (e) {
      debugPrint('Error in deleting user: $e');
      rethrow;
    }
  }

  @override
  Future<Response> getAllProperties() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.properties);
      return response;
    } catch (e) {
      debugPrint('Error in retrieving properties: $e');
      rethrow;
    }
  }

  @override
  Future<Response> getAllBookings() async {
    try {
      final response = await DioHelper.getData(url: EndPoints.bookings);
      return response;
    } catch (e) {
      debugPrint('Error in retrieving bookings: $e');
      rethrow;
    }
  }
}
