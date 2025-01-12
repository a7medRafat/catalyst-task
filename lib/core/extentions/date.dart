import 'package:intl/intl.dart';

extension DateTimeFormatting on String {
  String toCustomString() {
    DateTime date = DateTime.parse(this);

    return DateFormat('MMM dd-yyyy').format(date);
  }
}
