class GetAddressByIdModel {
  String? result;
  String? msg;
  Data? data;

  GetAddressByIdModel({this.result, this.msg, this.data});

  GetAddressByIdModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? addressName;
  String? recipientName;
  String? addressType;
  String? floorNumber;
  String? zipCode;
  String? address;
  String? phone;

  Data(
      {this.addressName,
        this.recipientName,
        this.addressType,
        this.floorNumber,
        this.zipCode,
        this.address,
        this.phone});

  Data.fromJson(Map<String, dynamic> json) {
    addressName = json['address_name'];
    recipientName = json['recipient_name'];
    addressType = json['address_type'];
    floorNumber = json['floor_number'];
    zipCode = json['zip_code'];
    address = json['address'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_name'] = this.addressName;
    data['recipient_name'] = this.recipientName;
    data['address_type'] = this.addressType;
    data['floor_number'] = this.floorNumber;
    data['zip_code'] = this.zipCode;
    data['address'] = this.address;
    data['phone'] = this.phone;
    return data;
  }
}
