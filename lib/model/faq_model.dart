class FaqModel {
  String? result;
  String? msg;
  List<FaqData>? data;

  FaqModel({this.result, this.msg, this.data});

  FaqModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <FaqData>[];
      json['data'].forEach((v) {
        data!.add(new FaqData.fromJson(v));
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

class FaqData {
  int? id;
  String? ques;
  String? ans;

  FaqData({this.id, this.ques, this.ans});

  FaqData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ques = json['ques'];
    ans = json['ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ques'] = this.ques;
    data['ans'] = this.ans;
    return data;
  }
}
