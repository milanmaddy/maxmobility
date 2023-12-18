import 'package:get/get.dart';

class Validation {
  // static const String EMAIL_V = 'Enter a valid email';
  // static const String EMAIL_E = "Email can't be empty";
  // static const String SPACE_ERROR = "Spaces are not allowed";

  static String? nameValidation(String value,{String msg="Name can't be empty"}) {
    String pattern = r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$";
    // RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return msg;
    }
    // else if (!regExp.hasMatch(pattern)) {
    //   return "Please enter a valid full name";
    // }
    return null;
  }

  static String? emailValidation(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value.isNotEmpty) {
      if (!GetUtils.isEmail(value) || value == null) {
        return 'Enter a valid email';
      } else {
        return null;
      }
    } else {
      return "Email can't be empty";
    }
  }

  static String? passwordValidation(String value){
    if(value.isEmpty){
      return "Password can't be empty";
    }else if(value.length < 8){
      return "Password length must be atleast 8 characters";
    }else{
      return null;
    }
  }

  static  String? confirmPasswordValidation(String value, String value2, String type) {
    // (?=.*[A-Z])       // should contain at least one upper case
    // (?=.*[a-z])       // should contain at least one lower case
    // (?=.*?[0-9])      // should contain at least one digit
    // (?=.*?[!@#\$&*~]) // should contain at least one Special character
    // .{8,}             // Must be at least 8 characters in length
    if (type != "normal") {
      // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
      RegExp uperCase = RegExp(r'(?=.*[A-Z])');
      RegExp lowerCase = RegExp(r'(?=.*[a-z])');
      RegExp number = RegExp(r'(?=.*?[0-9])');
      RegExp length = RegExp(r'.{8,}$');
      if (value.isEmpty) {
        return "Password can't be empty!";
      }
      // else if (!uperCase.hasMatch(value)) {
      //   return 'Must contain atlist 1 in Capital Case!';
      // } else if (!lowerCase.hasMatch(value)) {
      //   return 'Must contain atlist 1 in Small Case!';
      // } else if (!number.hasMatch(value)) {
      //   return 'Must contain atlist 1 Number!';
      // } else
      if (!length.hasMatch(value)) {
        return 'must be atleast 8 characters! ';
      } else
      if (value2 != value) {
        return "Password doesn't match";
      } else
        return null;
    } else {
      if (value.isEmpty) {
        return "Password can't be empty";
      }
    }
  }


  static String? normalValidation(String value) {
    if (!value.isEmpty) {
      return null;
    } else {
      return "Field can't be empty";
    }
  }
}
