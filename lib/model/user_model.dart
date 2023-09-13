class UserModel {
  String? result;
  String? message;
  Data? data;

  UserModel({this.result, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['msg'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? customerId;
  String? customerName;
  String? customerEmail;
  String? customerPhone;
  String? customerCountryCode;
  String? profileImage;
  String? status;
dynamic createdAt;
  dynamic updatedAt;
  String? token;

  Data(
      {this.customerId,
        this.customerName,
        this.customerEmail,
        this.customerPhone,
        this.customerCountryCode,
        this.profileImage,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.token});

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerPhone = json['customer_phone'];
    customerCountryCode = json['customer_country_code'];
    profileImage = json['profile_image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_name'] = this.customerName;
    data['customer_email'] = this.customerEmail;
    data['customer_phone'] = this.customerPhone;
    data['customer_country_code'] = this.customerCountryCode;
    data['profile_image'] = this.profileImage;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}
