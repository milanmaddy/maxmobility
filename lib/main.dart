import 'package:flutter/material.dart';
// import 'package:maxmobility/Screens/sign_in.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'Controller/customer_controller.dart';
import 'Screens/intro.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        // useMaterial3: true,
        fontFamily: 'Epilogue'
      ),
        initialBinding: BindingsBuilder(() {
          Get.put(CustomerController());
        }),
      home: Intro()
    );
  }
}
