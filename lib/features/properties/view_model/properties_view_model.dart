import 'package:catalyst/features/properties/model/PropertiesModel.dart';
import 'package:catalyst/features/properties/repository/properties_repository.dart';
import 'package:flutter/cupertino.dart';

class PropertiesViewModel extends ChangeNotifier {
  List<PropertiesModel> properties = [];
  bool _isLoading = false;
  final PropertiesRepository _repository = PropertiesRepository();

  bool get isLoading => _isLoading;

  bool isExpanded = false;

  void changeExpanded() {
    isExpanded = !isExpanded;
    notifyListeners();
  }

  void _updateLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> getAllProperties() async {
    _updateLoading(true);
    try {
      properties = await _repository.getAllProperties();
      _updateLoading(false);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching properties: $e');
      _updateLoading(false);
      notifyListeners();
    }
  }
}
