import 'package:catalyst/core/api_services/api_services.dart';
import 'package:catalyst/features/bookings/model/BookingModel.dart';
import 'package:dio/dio.dart';

class BookingsRepository {
  final ApiService _service = ApiServiceImpl();

  Future<List<BookingModel>> getAllBookings() async {
    try {
      final Response response = await _service.getAllBookings();

      if (response.statusCode == 200) {
        final List<dynamic> propertiesJson = response.data;
        return propertiesJson
            .map((booking) => BookingModel.fromJson(booking))
            .toList();
      } else {
        throw Exception('Failed to fetch bookings: ${response.statusMessage}');
      }
    } catch (e) {
      throw Exception('Error fetching bookings: $e');
    }
  }
}
