import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MyQuickAlert {
  static void show(context, String text) => QuickAlert.show(
        context: context,
        title: text,
        type: QuickAlertType.success,
        borderRadius: 5,
        showConfirmBtn: false,
      );
}
