import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:maxmobility/Screens/sign_in.dart';
import '../Model/user_model.dart';
import '../Screens/dashboard.dart';
import '../Screens/sign_in.dart';

class UserController extends GetxController {
  final box = GetStorage();

  List<User> getAllUsers() {
    final List<dynamic>? users = box.read<List<dynamic>>('users');
    if (users != null) {
      return users.map((userMap) => User.fromJson(Map<String, dynamic>.from(userMap))).toList();
    }
    return [];
  }

  bool isEmailRegistered(String? email) {
    final List<User> users = getAllUsers();
    return users.any((user) => user.email == email);
  }

  void registeredUser(User user) {
    List<User> users = getAllUsers();
    if (isEmailRegistered(user.email)) {
      Get.snackbar(
        'Email Already Registered',
        'The email is already registered.',
         borderRadius: 5,
         snackPosition: SnackPosition.BOTTOM,
         colorText: Colors.green[600]
      );
      print(box.read('users'));
    } else {
      users.add(user);
      box.write('users', users.map((user) => user.toJson()).toList());
      Get.snackbar(
        'Registration Successful',
        'User ${user.name} registered successfully!',
         borderRadius: 5,
         snackPosition: SnackPosition.BOTTOM,
         colorText: Colors.green[600]
      );
      Get.to(() => SignInPage());
      print(box.read('users'));
    }
  }

  bool validateLogin(String? email, String? password) {

    final List<User> users = getAllUsers();
    final user = users.firstWhere((user) => user.email == email);
    return user.password == password;
  }

  void loginUser(User user){

    if (isEmailRegistered(user.email)) {
      if (validateLogin(user.email, user.password)) {
        Get.snackbar(
            'Login Successful',
            'Welcome ${user.email}!',
            borderRadius: 5,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.green[600]
        );
        print(box.read('users'));
        Get.offAll(() => DashBoard());
      } else {
        Get.snackbar(
            'Login Failed',
            'Incorrect password.',
            borderRadius: 5,
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.redAccent
        );
        print(box.read('users'));
        print(user.email);
        print(user.password);
      }
    } else {
      Get.snackbar(
          'Login Failed',
          'The email is not registered.',
          borderRadius: 5,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.redAccent
      );
      print(box.read('users'));
      print(user.email);
      print(user.password);
    }
  }
}
