import 'package:catalyst/core/api_services/api_services.dart';
import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:dio/dio.dart';

class PropertiesRepository {
  final ApiService _service = ApiServiceImpl();

  Future<List<PropertiesModel>> getAllProperties() async {
    try {
      final Response response = await _service.getAllProperties();

      if (response.statusCode == 200) {
        final List<dynamic> propertiesJson = response.data;
        return propertiesJson
            .map((property) => PropertiesModel.fromJson(property))
            .toList();
      } else {
        throw Exception(
            'Failed to fetch properties: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching properties: $e');
    }
  }
}
