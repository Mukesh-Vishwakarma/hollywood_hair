class BaseModel {
  dynamic result;
  String? message;

  BaseModel({this.result, this.message});

  BaseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['msg'] = this.message;
    return data;
  }
}
