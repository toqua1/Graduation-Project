class ChangePasswordModel {
  // final String status;
  final String message;
  final String resetToken;

  ChangePasswordModel({
    // required this.status,
    required this.message,
    required this.resetToken,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      // status: json['status'],
      message: json["result"]['message'],
      resetToken: json["result"]['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'status': status,
      'message': message,
      'resetToken': resetToken,
    };
  }
}