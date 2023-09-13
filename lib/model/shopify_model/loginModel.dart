class LoginModel {
  LoginData? data;

  LoginModel({this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class LoginData {
  CustomerAccessTokenCreate? customerAccessTokenCreate;

  LoginData({this.customerAccessTokenCreate});

  LoginData.fromJson(Map<String, dynamic> json) {
    customerAccessTokenCreate = json['customerAccessTokenCreate'] != null
        ? new CustomerAccessTokenCreate.fromJson(
        json['customerAccessTokenCreate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerAccessTokenCreate != null) {
      data['customerAccessTokenCreate'] =
          this.customerAccessTokenCreate!.toJson();
    }
    return data;
  }
}

class CustomerAccessTokenCreate {
  CustomerAccessToken? customerAccessToken;
 dynamic customerUserErrors;

  CustomerAccessTokenCreate(
      {this.customerAccessToken, this.customerUserErrors});

  CustomerAccessTokenCreate.fromJson(Map<String, dynamic> json) {
    customerAccessToken = json['customerAccessToken'] != null
        ? new CustomerAccessToken.fromJson(json['customerAccessToken'])
        : null;
    if (json['customerUserErrors'] != null) {
      customerUserErrors = <Null>[];
      // json['customerUserErrors'].forEach((v) {
      //   customerUserErrors!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerAccessToken != null) {
      data['customerAccessToken'] = this.customerAccessToken!.toJson();
    }
    if (this.customerUserErrors != null) {
      data['customerUserErrors'] =
          this.customerUserErrors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerAccessToken {
  String? accessToken;

  CustomerAccessToken({this.accessToken});

  CustomerAccessToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    return data;
  }
}
