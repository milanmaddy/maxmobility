class CustomerModel {
  Customer? customer;

  CustomerModel({this.customer});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Customer {
  String? name;
  String? email;
  String? gender;
  String? address;
  List<dynamic>? habit;

  Customer({this.name, this.email, this.gender, this.address, this.habit});

  Customer.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    address = json['address'];
    habit = json['habit'] != null ?
    List<String>.from(json['habit'] as Iterable<dynamic>) : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['habit'] = this.habit;
    return data;
  }
}