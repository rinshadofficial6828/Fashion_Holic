class LoginResponse {
  int? id;
  String? token;
  String? message;
  bool? status;

  LoginResponse({this.id, this.token, this.message, this.status});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
