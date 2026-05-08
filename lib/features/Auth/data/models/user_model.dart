

class UserModel {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
     this.phone,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      email: json["email"],
      token: json["token"],
    );
  }
}