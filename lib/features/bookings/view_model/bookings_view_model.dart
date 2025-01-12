import 'package:catalyst/features/bookings/model/BookingModel.dart';
import 'package:catalyst/features/bookings/repository/bookings_repository.dart';
import 'package:flutter/cupertino.dart';

class BookingsViewModel extends ChangeNotifier {
  final BookingsRepository _repository = BookingsRepository();
  List<BookingModel> bookings = [];
  String currentFilter = 'All';
  List<BookingModel> filteredBookings = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _updateLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> getAllBookings() async {
    _updateLoading(true);
    try {
      bookings = await _repository.getAllBookings();
      filteredBookings = bookings;
      _updateLoading(false);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching bookings: $e');
      _updateLoading(false);
      notifyListeners();
    }
  }

  void applyFilter(String filter) {
    currentFilter = filter;
    if (filter == 'All') {
      filteredBookings = bookings;
    } else {
      filteredBookings = bookings
          .where((booking) =>
              booking.status!.toLowerCase() == filter.toLowerCase())
          .toList();
    }
    notifyListeners();
  }
}
