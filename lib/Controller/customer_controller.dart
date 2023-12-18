import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
// import 'package:maxmobility/Screens/dashboard.dart';
import '../Model/customer_model.dart';
import '../Screens/dashboard.dart';

class CustomerController extends GetxController{

  final box = GetStorage();

  Future<List<Customer>?> getAllCustomers() async {
    print('Fetching customers...');
    final List<dynamic>? users = box.read<List<dynamic>>('customers');
    if (users != null) {
      print('Users: $users');
      return users.map((userMap) => Customer.fromJson(Map<String, dynamic>.from(userMap))).toList();
    } else {
      print('No users found');
      return null;
    }
  }

  Future<void> clearAllCustomers() async {
    await box.remove('customers');
    update();
  }


  Future<bool> isEmailRegistered(String? email) async {
    final List<Customer>? customers = await getAllCustomers();
    return customers?.any((customer) => customer.email == email) ?? false;
  }


  void addCustomer(Customer customer)async{
      List<Customer>? customers = await getAllCustomers() ?? [];
      customers.add(customer);
      box.write('customers', customers.map((customer) => customer.toJson()).toList());
      Get.snackbar(
        'SUCCESS',
        'Customer ${customer.name} added successfully!',
         borderRadius: 5,
         snackPosition: SnackPosition.BOTTOM,
         colorText: Colors.green[600]
      );
      print(box.read('customers'));
      // print(box.read('users'));
      Get.offAll(() => DashBoard());
    // }
  }

  void deleteCustomer(Customer customer)async{
    List<Customer>? customers = await getAllCustomers();
    customers!.removeWhere((c) => c.email == customer.email);
    box.write('customers', customers.map((customer) => customer.toJson()).toList());
    update();
    print(box.read('customers'));
    Get.snackbar(
        'SUCCESS',
        'Customer ${customer.name} deleted successfully!',
        borderRadius: 5,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.green[600]
    );
    Get.offAll(() => DashBoard());
  }

  Future<void> editCustomer(String email, Customer updatedCustomer) async {
    List<Customer>? customers = await getAllCustomers();
    int index = customers!.indexWhere((customer) => customer.email == email);

    if (index != -1) {
      customers[index] = Customer(
        name: updatedCustomer.name ?? customers[index].name,
        email: updatedCustomer.email ?? customers[index].email,
        gender: updatedCustomer.gender ?? customers[index].gender,
        address: updatedCustomer.address ?? customers[index].address,
        habit: updatedCustomer.habit ?? customers[index].habit,
      );
      box.write('customers', customers.map((customer) => customer.toJson()).toList());
      update();
      Get.snackbar(
        'SUCCESS',
        'Customer ${updatedCustomer.name} updated successfully!',
        borderRadius: 5,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.green[600],
      );
      Get.offAll(() => DashBoard());
    } else {
      Get.snackbar(
        'ERROR',
        'Customer not found for email $email',
        borderRadius: 5,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.red[600],
      );
    }
    update();
  }
}