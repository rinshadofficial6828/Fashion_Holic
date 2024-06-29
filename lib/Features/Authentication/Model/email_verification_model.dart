class EmailVerificationModel {
  String? detail;
  bool? status;

  EmailVerificationModel({this.detail, this.status});

  EmailVerificationModel.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    data['status'] = this.status;
    return data;
  }
}