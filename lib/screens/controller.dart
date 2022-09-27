import 'package:get/get.dart';

class MyController extends GetxController {
  bool tapped = false;
  String res = "";
  void updateTap(val) {
    if (val == 1) {
      res = "rollno";
    } else if (val == 2) {
      res = "pswd";
    } else if (val == 3) {
      res = "name";
    }
    tapped = !tapped;
    update();
  }
}
