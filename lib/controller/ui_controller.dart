import 'package:get/state_manager.dart';

class UiController extends GetxController {
  RxBool isObscure = true.obs;

  isObscureActivate() {
    isObscure.value = !isObscure.value;
  }
}
