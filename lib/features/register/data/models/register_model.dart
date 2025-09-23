class RegisterModel {
  final String message;
  final UserData data;

  RegisterModel({required this.message, required this.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      message: json['message'] ?? "",
      data: UserData.fromJson(json['data']),
    );
  }
}

class UserData {
  final String email;
  final String name;
  final String phone;
  final int avaterId;
  final String id;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.email,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'] ?? "",
      name: json['name'] ?? "",
      phone: json['phone'] ?? "",
      avaterId: json['avaterId'] ?? 0,
      id: json['_id'] ?? "",
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
    );
  }
}
