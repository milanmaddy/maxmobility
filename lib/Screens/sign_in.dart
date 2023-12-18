import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maxmobility/Constraints/color_manager.dart';
import 'package:maxmobility/Constraints/img_manager.dart';
import 'package:maxmobility/Custom%20Widgets/input_field.dart';
import 'package:maxmobility/Screens/sign_up.dart';
import '../Controller/user_controller.dart';
import '../Custom Widgets/buttons.dart';
import 'package:get/get.dart';

import '../Custom Widgets/password_field.dart';
import '../Model/user_model.dart';
import '../validation.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0). copyWith(top: 150),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 180, width: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorManager.primary,
                        width: 18
                      )
                    ),
                    child: SvgPicture.asset(ImageManager.login)),
                const SizedBox(height: 30),
                Text('SIGN IN',
                  style: TextStyle(
                  color: ColorManager.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 40
                ),
                ),
                const SizedBox(height: 50),
                CustomInputField(controller: emailController, prefixIcon: Icons.mail_outline, hint: 'Email Address',
                    validation: (data) => Validation.emailValidation(data)),
                const SizedBox(height: 20),
                CustomPasswordField(controller: passwordController, hint: 'Password',
                    validation: (data) => Validation.passwordValidation(data)),
                const SizedBox(height: 50),
                Buttons.actionButtons(title: 'Sign In', event: (){
                  if(formKey.currentState!.validate()){
                    User user = User(
                        email: emailController.text,
                        password: passwordController.text,
                    );
                    userController.loginUser(user);
                  }
                }),
                const SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account yet?",style: TextStyle(color: Colors.black,fontSize: 14)),
                    const SizedBox(width: 5),
                    GestureDetector(onTap: (){
                      Get.to(() => SignUpPage());
                    }, child: Text("Sign Up",style: TextStyle(
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14)))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
