import 'package:fluttertoast/fluttertoast.dart';

import '../helper/color_helper.dart';

class ToastWidget {
  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.TOP,
        backgroundColor: AppColor.primary2);
  }
}










