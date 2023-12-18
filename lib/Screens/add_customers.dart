import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Constraints/color_manager.dart';
import '../Controller/customer_controller.dart';
import '../Custom Widgets/buttons.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../Custom Widgets/input_field.dart';
import '../Model/customer_model.dart';
import '../validation.dart';


class AddCustomer extends StatelessWidget {
  AddCustomer({Key? key}) : super(key: key);

  CustomerController customerController = Get.put(CustomerController());

  RxString selectedValue = ''.obs;
  List<dynamic> selectedValues = [];
  List listItem = ["Reading", 'Writing', 'Playing', 'Binge watching'];
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, bottom: 20, left: 20),
                color: ColorManager.primary,
                width: Get.width,
                child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){Get.back();},
                        child: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 30)),
                    const SizedBox(width: 25),
                    const Text('Add Customer',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(30),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Fill the details',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(controller: nameController, prefixIcon: Icons.person_2_outlined, hint: 'Name',
                        validation: (data) => Validation.nameValidation(data)),
                    const SizedBox(height: 20),
                    CustomInputField(controller: emailController, prefixIcon: Icons.mail_outline_rounded, hint: 'Email Address',
                        validation: (data) => Validation.emailValidation(data)),
                    const SizedBox(height: 20),
                    DropdownButtonFormField<String>(
                      // value: selectedValue.value,
                      onChanged: (newValue) {
                        selectedValue.value = newValue!;
                      },

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field can't be empty";
                        } else {
                          return null;
                        }
                      },
                      hint: Text('Select Gender'),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 20).copyWith(right: 15),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        filled: true,
                        fillColor: const Color(0x2692E3A9),
                        prefixIcon: const Icon(Icons.people_alt_outlined, color: Colors.black)
                      ),
                      borderRadius: BorderRadius.circular(10),
                      style: const TextStyle(fontFamily: 'Epilogue', color: Colors.black, fontSize: 16),
                      icon: const Icon(Icons.expand_more_outlined, color: Colors.black,),
                      items: ['Male', 'Female', 'Others'].map((value) => DropdownMenuItem<String>(value: value,
                        child: Text(value, style: const TextStyle(fontFamily: 'Epilogue'),),
                      )).toList(),
                      // elevation: 0,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(controller: addressController, prefixIcon: Icons.home_outlined, hint: 'Address',
                        validation: (data) => Validation.normalValidation(data)),
                    const SizedBox(height: 20),
                    MultiSelectDialogField(
                      buttonText: Text('Select Habit', style: TextStyle(color: Colors.grey.shade500, fontSize: 16),),
                      title: const Text('Select Habit'),
                      validator: null,
                      selectedColor: ColorManager.primary,
                      selectedItemsTextStyle: const TextStyle(color: Colors.black, fontSize: 16),
                      items: listItem.map((e) => MultiSelectItem(e, e)).toList(),
                      listType: MultiSelectListType.CHIP,
                      decoration: BoxDecoration(
                        color: const Color(0x2692E3A9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      buttonIcon: const Icon(Icons.expand_more_outlined),
                      onSelectionChanged: (List<dynamic> value) {
                        selectedValues = value;
                        print(selectedValues);
                      },
                      onConfirm: (List<dynamic> value) {},

                    ),
                    const SizedBox(height: 50),
                    Center(child: Buttons.actionButtons(title: 'Save', event: (){
                      if(formKey.currentState!.validate()){
                        Customer customer = Customer(
                            name: nameController.text,
                            email: emailController.text,
                            gender: selectedValue.value,
                            address: addressController.text,
                            habit: selectedValues
                        );
                        customerController.addCustomer(customer);
                      }
                    })),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
