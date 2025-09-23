import 'package:dartz/dartz.dart';
import 'package:law_diary/features/auth/data/models/auth_req_params.dart';
import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';

abstract class AuthRepository {
  Future<Either> login(LoginRequestModel request);
  Future<bool> isLoggedIn();
  Future<String> getToken();
  Future<UserEntity> getLoginUserData();
}
