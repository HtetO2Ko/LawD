import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class ChangeVisibility extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final UserEntity userData;
  LoginSuccess({required this.userData});
}

class LoginError extends LoginState {
  final String message;
  LoginError({required this.message});
}
