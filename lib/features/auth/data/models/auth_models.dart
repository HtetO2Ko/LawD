import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.userId,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.password,
    required super.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userid"] ?? "",
      username: json["name"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      password: json["password"] ?? "",
      role: json["role"] ?? "",
    );
  }
}
