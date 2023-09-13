class SignUpModel {
  SignUpData? data;

  SignUpModel({this.data});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new SignUpData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class SignUpData {
  CustomerCreate? customerCreate;

  SignUpData({this.customerCreate});

  SignUpData.fromJson(Map<String, dynamic> json) {
    customerCreate = json['customerCreate'] != null
        ? new CustomerCreate.fromJson(json['customerCreate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerCreate != null) {
      data['customerCreate'] = this.customerCreate!.toJson();
    }
    return data;
  }
}

class CustomerCreate {
  CustomerData? customer;
 dynamic customerUserErrors;

  CustomerCreate({this.customer, this.customerUserErrors});

  CustomerCreate.fromJson(Map<String, dynamic> json) {
    customer = json['customer'] != null
        ? new CustomerData.fromJson(json['customer'])
        : null;
    if (json['customerUserErrors'] != null) {
      customerUserErrors = <Null>[];
      json['customerUserErrors'].forEach((v) {
        // customerUserErrors!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.customerUserErrors != null) {
      data['customerUserErrors'] =
          this.customerUserErrors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerData {
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? acceptsMarketing;

  CustomerData(
      {this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.acceptsMarketing});

  CustomerData.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    acceptsMarketing = json['acceptsMarketing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['acceptsMarketing'] = this.acceptsMarketing;
    return data;
  }
}
