import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String username;
  final String firstName;
  final String lastName;
  final String password;
  final String role;

  const UserEntity({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.password,
    required this.role,
  });

  @override
  List<Object?> get props => [userId, username, firstName, lastName, role];
}
