import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constraints/color_manager.dart';
import '../splash_controller.dart';

class Intro extends StatelessWidget {
  Intro({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Assignment",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50
              ),
            ),
            const SizedBox(height: 20),
            Text("Max Mobility Pvt. Ltd.",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
          ],
        ),
      ),
    );
  }
}
