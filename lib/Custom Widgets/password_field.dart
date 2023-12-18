import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPasswordField extends StatelessWidget {
  CustomPasswordField(
      {Key? key,
        required this.controller,
        required this.hint,
        this.suffixIcon = "",
        this.validation})
      : super(key: key);
  String suffixIcon;
  String hint;
  TextEditingController controller;
  Function? validation;
  var visible = true.obs;
  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
      controller: controller,
      validator: (value){
        if(validation!=null){
          return validation!(value);
        }
        return null;
      },
      keyboardType: TextInputType.text,
      obscureText: visible.value,
      decoration:
      InputDecoration(
        fillColor: const Color(0x2692E3A9),
        filled: true,
        errorStyle: TextStyle(),
        contentPadding: const EdgeInsets.symmetric(vertical: 20),
        prefixIcon: Icon(Icons.lock_outline, color: Colors.black),
        suffixIcon: GestureDetector(
          onTap: (){
            visible.value = !visible.value;
          },
          child: Container(
            // height: 20,width: 20,
            // color:Colors.red,
              padding: EdgeInsets.all(12).copyWith(right: 8),
              child: !visible.value?
              Icon(Icons.visibility_outlined,color:Colors.black):
              Icon(Icons.visibility_off_outlined,color:Colors.black)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500)
      ),
    ));
  }
}