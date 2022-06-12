import 'package:fluttertoast/fluttertoast.dart';
import 'package:take_home_pj/utils/colors.dart';

void showToast(String message) {
  if (message != null && message.isNotEmpty) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 16,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: COLORS.toast_background_color,
        textColor: COLORS.white);
  }
}
