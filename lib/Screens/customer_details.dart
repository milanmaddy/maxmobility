import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constraints/color_manager.dart';
import '../Custom Widgets/buttons.dart';
import 'delete_user.dart';
import 'edit_customer.dart';

class CustomerDetails extends StatelessWidget {
  CustomerDetails({Key? key,
    required this.name,
    required this.email,
    required this.gender,
    required this.address,
    required this.habit,
  }) : super(key: key);

  String name;
  String email;
  String gender;
  String address;
  List habit;

  @override
  Widget build(BuildContext context) {
    print(habit);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  const Text('Personal Details',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(20).copyWith(top: 70),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(17),
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        shape: BoxShape.circle
                      ),
                      child: const Icon(Icons.person, size: 150, color: Colors.white),

                    ),
                  ),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                          ),

                        ),
                        child: const Text('Name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      ),
                      Container(
                          padding: const EdgeInsets.all(13),
                          width: Get.width,
                          decoration: BoxDecoration(
                            // color: ColorManager.primary,
                            border: Border.all(
                                color: ColorManager.primary,
                                width: 2
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)
                            ),

                          ),
                          child: Text(name, style: const TextStyle(fontSize: 16),),
                        // Text(habit[0], style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                          ),

                        ),
                        child: const Text('Email ID', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      ),
                      Container(
                        padding: const EdgeInsets.all(13),
                        width: Get.width,
                        decoration: BoxDecoration(
                          // color: ColorManager.primary,
                          border: Border.all(
                              color: ColorManager.primary,
                              width: 2
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),

                        ),
                        child: Text(email, style: const TextStyle(fontSize: 16),),
                        // Text(habit[0], style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                          ),

                        ),
                        child: const Text('Gender', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      ),
                      Container(
                        padding: const EdgeInsets.all(13),
                        width: Get.width,
                        decoration: BoxDecoration(
                          // color: ColorManager.primary,
                          border: Border.all(
                              color: ColorManager.primary,
                              width: 2
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),

                        ),
                        child: Text(gender, style: const TextStyle(fontSize: 16),),
                        // Text(habit[0], style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                          ),

                        ),
                        child: const Text('Address', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      ),
                      Container(
                        padding: const EdgeInsets.all(13),
                        width: Get.width,
                        decoration: BoxDecoration(
                          // color: ColorManager.primary,
                          border: Border.all(
                              color: ColorManager.primary,
                              width: 2
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),

                        ),
                        child: Text(address, style: const TextStyle(fontSize: 16),),
                        // Text(habit[0], style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        width: Get.width,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: ColorManager.primary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)
                          ),

                        ),
                        child: const Text('Habit', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      ),
                      Container(
                        padding: const EdgeInsets.all(13),
                        decoration: BoxDecoration(
                          // color: ColorManager.primary,
                          border: Border.all(
                              color: ColorManager.primary,
                              width: 2
                          ),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),

                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: habit.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text('• ${habit[index]}', style: const TextStyle(fontSize: 16),),
                              );
                            }
                            )
                        // Text(habit[0], style: TextStyle(fontSize: 20),),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80),
                  Row(
                    children: [
                      Expanded(child: Buttons.actionButtons(title: 'Edit', event: (){
                        print('Habit1: $habit');
                        Get.to(() => EditCustomer(
                          name: name,
                          email: email,
                          gender: gender,
                          address: address,
                          habit: habit,
                        ));
                      })),
                      const SizedBox(width: 20),
                      Expanded(child: Buttons.actionButtons2(title: 'Delete', event: (){Get.bottomSheet(DeletePopup(email: email));})),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
