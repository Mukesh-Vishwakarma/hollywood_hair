class StaticModel {
  int? result;
  String? msg;
  StaticData? data;

  StaticModel({this.result, this.msg, this.data});

  StaticModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    data = json['data'] != null ? new StaticData.fromJson(json['data']) : null;
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

class StaticData {
  int? settingId;
  String? type;
  String? description;
  int? region;
  String? createdAt;
  String? updatedAt;

  StaticData(
      {this.settingId,
        this.type,
        this.description,
        this.region,
        this.createdAt,
        this.updatedAt});

  StaticData.fromJson(Map<String, dynamic> json) {
    settingId = json['setting_id'];
    type = json['type'];
    description = json['description'];
    region = json['region'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['setting_id'] = this.settingId;
    data['type'] = this.type;
    data['description'] = this.description;
    data['region'] = this.region;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
