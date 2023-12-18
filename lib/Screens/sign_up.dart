import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../Constraints/color_manager.dart';
import '../Constraints/img_manager.dart';
import '../Controller/user_controller.dart';
import '../Custom Widgets/buttons.dart';
import '../Custom Widgets/input_field.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../Custom Widgets/password_field.dart';
import '../Model/user_model.dart';
import '../validation.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final dobController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0). copyWith(top: 50, bottom: 40),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: (){Get.back();},
                    child: Container(
                      height: 40, width: 40,
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 0.5,
                            offset: const Offset(0, 2),
                            color: Colors.grey.shade400
                          )
                        ]
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_outlined, size: 25, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    height: 180, width: 180,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: ColorManager.primary,
                            width: 18
                        )
                    ),
                    child: SvgPicture.asset(ImageManager.signup)),
                const SizedBox(height: 30),
                Text('SIGN UP',
                  style: TextStyle(
                      color: ColorManager.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 40
                  ),
                ),
                const SizedBox(height: 50),
                CustomInputField(controller: nameController, prefixIcon: Icons.person, hint: 'Name',
                    validation: (data) => Validation.nameValidation(data)),
                const SizedBox(height: 20),
                CustomInputField(controller: emailController, prefixIcon: Icons.mail_outline, hint: 'Email Address',
                    validation: (data) => Validation.emailValidation(data)),
                const SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  validator: (value){
                    if (value!.isEmpty) {
                      return "Field can't be empty";
                    } else {
                      return null;
                    }
                  },
                  controller: dobController,
                  decoration: InputDecoration(
                      counterText: "",
                      fillColor: const Color(0x2692E3A9),
                      filled: true,
                      errorStyle: const TextStyle(),
                      contentPadding: const EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: const Icon(Icons.calendar_today_outlined, color: Colors.black),
                      suffixIcon: GestureDetector(
                        onTap: ()async{
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime.now()
                          );

                          if(pickedDate != null){
                            print(pickedDate);

                            String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(formattedDate);
                            dobController.text = formattedDate;
                          }else{}
                        },
                          child: const Icon(Icons.calendar_month_outlined, color: Colors.black)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Date of Birth',
                      hintStyle: TextStyle(color: Colors.grey.shade500, fontWeight: FontWeight.w500)
                  ),
                ),
                const SizedBox(height: 20),
                CustomPasswordField(controller: passwordController, hint: 'Password',
                    validation: (pass1) => Validation.passwordValidation(pass1)),
                const SizedBox(height: 20),
                CustomPasswordField(controller: password2Controller, hint: 'Confirm Password',
                    validation: (data) => Validation.confirmPasswordValidation(data, passwordController.text, '')),
                const SizedBox(height: 50),
                Buttons.actionButtons(title: 'Sign In', event: (){
                  if(formKey.currentState!.validate()){
                    User user = User(
                      name: nameController.text,
                      email: emailController.text,
                      dob: dobController.text,
                      password: passwordController.text,
                      confirmPassword: password2Controller.text
                    );
                    userController.registeredUser(user);
                  }
                }),
                const SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?",style: TextStyle(color: Colors.black,fontSize: 14)),
                    const SizedBox(width: 5),
                    GestureDetector(onTap: (){Get.back();}, child: Text("Sign In",style: TextStyle(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)))
                  ],
                ),
                const SizedBox(height: 40),
                const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("Terms & condition | ", style: TextStyle(fontSize: 12),),
                  Text("Privacy Policy", style: TextStyle(fontSize: 12))
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
