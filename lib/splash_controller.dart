import 'dart:async';
import 'package:get/get.dart';
import 'Screens/sign_in.dart';
// import 'package:maxmobility/Screens/sign_in.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => SignInPage());
    });
  }
}