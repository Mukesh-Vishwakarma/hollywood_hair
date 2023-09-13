class CustomerDetailsModel {
  CustomerData? data;

  CustomerDetailsModel({this.data});

  CustomerDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new CustomerData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class CustomerData {
  Customer? customer;

  CustomerData({this.customer});

  CustomerData.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
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
  String? id;
  String? firstName;
  String? lastName;
  bool? acceptsMarketing;
  String? email;
  String? phone;

  Customer(
      {this.id,
        this.firstName,
        this.lastName,
        this.acceptsMarketing,
        this.email,
        this.phone});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    acceptsMarketing = json['acceptsMarketing'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['acceptsMarketing'] = this.acceptsMarketing;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}
