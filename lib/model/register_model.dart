class RegisterModel {
  final String status;
  final String message;
  final dynamic data;

  RegisterModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      status: json['status']?.toString() ?? '0',
      message: json['msg'] ?? 'No message',
      data: json['data'],
    );
  }
}
