import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';

import '../Constraints/color_manager.dart';
import '../Constraints/img_manager.dart';
import '../Controller/customer_controller.dart';
import '../Model/customer_model.dart';
import 'add_customers.dart';
import 'customer_details.dart';

class DashBoard extends StatelessWidget {
  DashBoard({Key? key}) : super(key: key);

  CustomerController customerController = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 50, bottom: 20, left: 50),
            color: ColorManager.primary,
            width: Get.width,
            child: const Text('Home Page',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SvgPicture.asset(ImageManager.img, height: 250,),
          ),
          SizedBox(
            height: 490,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0).copyWith(bottom: 50),
                  child: GestureDetector(
                    onTap: (){Get.to(() => AddCustomer());},
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: Get.width,
                      // height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorManager.primary,
                          width: 3
                        )
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 40, width: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: ColorManager.primary,
                                    width: 3
                                )
                            ),
                            child: Icon(Icons.add_rounded, size: 30, color: ColorManager.primary),
                          ),
                          const SizedBox(width: 15),
                          const Text('Add Customers',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // Buttons.actionButtons(title: 'Clear', event: (){customerController.clearAllCustomers();}),
                // SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Image.asset(ImageManager.bullet, height: 20),
                      const SizedBox(width: 10),
                      const Text('Customer List',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: FutureBuilder<List<Customer>?>(
                    future: customerController.getAllCustomers(),
                    builder: (context, snapshot) {
                      print('Snapshot: $snapshot');
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        print('Error: ${snapshot.error}');
                        return const Center(child: Text('Error loading data'));
                      } else {
                        final List<Customer>? customers = snapshot.data;

                        if (customers == null || customers.isEmpty) {
                          return const Center(child: Text('No customers available', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),));
                        }
                        return ListView.builder(
                          padding: const EdgeInsets.all(20).copyWith(top: 5),
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: customers.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => CustomerDetails(
                                    name: customers[index].name ?? '',
                                    email: customers[index].email ?? '',
                                    gender: customers[index].gender ?? '',
                                    address: customers[index].address ?? '',
                                    habit: customers[index].habit ?? [],
                                  ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: ColorManager.primary,
                                      width: 3,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        offset: const Offset(2, 5),
                                        color: Colors.grey.shade300,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 75,
                                        width: 75,
                                        decoration: BoxDecoration(
                                          color: ColorManager.primary,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: const Icon(Icons.person, color: Colors.white, size: 70),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text('Name:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                              const SizedBox(width: 10),
                                              SizedBox(width: 160,
                                                  child: Text(customers[index].name ?? '', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            children: [
                                              const Text('Email ID:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                              const SizedBox(width: 10),
                                              SizedBox(width: 160,
                                                  child: Text(customers[index].email ?? 'N/A', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300), overflow: TextOverflow.ellipsis)),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          Row(
                                            children: [
                                              const Text('Gender', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                              const SizedBox(width: 10),
                                              Text(customers[index].gender ?? 'N/A', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
