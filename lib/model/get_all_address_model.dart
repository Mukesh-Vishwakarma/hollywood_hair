class GetAllAddressModel {
  String? result;
  String? msg;
  List<AllAddressData>? data;

  GetAllAddressModel({this.result, this.msg, this.data});

  GetAllAddressModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <AllAddressData>[];
      json['data'].forEach((v) {
        data!.add(new AllAddressData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllAddressData {
  int? id;
  String? address;
  String? addressType;
  int? customerId;
  String? name;
  String? phone;
  String? email;
  String? countryCode;

  AllAddressData(
      {this.id,
        this.address,
        this.addressType,
        this.customerId,
        this.name,
        this.phone,
        this.email,
        this.countryCode});

  AllAddressData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    addressType = json['address_type'];
    customerId = json['customer_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    countryCode = json['country_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['address_type'] = this.addressType;
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['country_code'] = this.countryCode;
    return data;
  }
}
