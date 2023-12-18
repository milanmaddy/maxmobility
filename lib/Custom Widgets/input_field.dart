import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:maxmobility/Constraints/color_manager.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({Key? key,
    required this.controller,
    required this.prefixIcon,
    required this.hint,
    // this.maxLength=200,
    this.type = TextInputType.text,
    this.validation,
    // this.onlySmallCaps=false,
    this.suffixIcon,
  }) : super(key: key);
  IconData prefixIcon;
  IconData? suffixIcon;
  String hint;
  // int maxLength;
  // bool onlySmallCaps;

  TextEditingController controller;
  TextInputType type;
  Function? validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(fontFamily: "Epilogue"),
      // textDirection: TextDirection.ltr,
      // textAlign: TextAlign.right,
      controller: controller,
      keyboardType: type,
      validator: (value){
        if(validation!=null){
          return validation!(value);
        }
        return "";
      },
      // onChanged: (v){
      // },
      // maxLength: maxLength,
      textCapitalization: TextCapitalization.none,
      // inputFormatters:onlySmallCaps? [
      //   FilteringTextInputFormatter.deny(RegExp('[A-Z]')),
      // ]:null,
      decoration:
      InputDecoration(
          counterText: "",
          fillColor: const Color(0x2692E3A9),
          filled: true,
          errorStyle: const TextStyle(),
          contentPadding: const EdgeInsets.symmetric(vertical: 20),
          prefixIcon: Icon(prefixIcon, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500)
      ),
    );
  }
}