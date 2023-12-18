import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:maxmobility/Constraints/color_manager.dart';
// import 'package:maxmobility/Controller/customer_controller.dart';
// import 'package:maxmobility/Model/customer_model.dart';

import '../Constraints/color_manager.dart';
import '../Controller/customer_controller.dart';
import '../Custom Widgets/buttons.dart';
import '../Model/customer_model.dart';

class DeletePopup extends StatelessWidget {
  DeletePopup({Key? key, required this.email}) : super(key: key);

  String email;

  CustomerController customerController = Get.put(CustomerController());


  @override
  Widget build(BuildContext context) {
    return Container(height: 260,
      padding: const EdgeInsets.all(15).copyWith(bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))
      ),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end ,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(onPressed: (){Get.back();},
                  icon: Icon(Icons.cancel_rounded, size: 42, color: ColorManager.primary,)
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text('Are you sure you want to\ndelete the customer?', textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 23)),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Buttons.actionButtons2(title: 'No', event: (){Get.back();})),
                const SizedBox(width: 30),
                Expanded(child: Buttons.actionButtons(title: 'Yes', event: (){
                  Customer customer = Customer(
                    email: email
                  );
                  customerController.deleteCustomer(customer);
                })),
              ],
            ),
          )
        ],
      ),
    );
  }
}