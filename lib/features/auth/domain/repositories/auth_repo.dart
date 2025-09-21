import 'package:law_diary/features/auth/data/models/auth_req_params.dart';
import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';

abstract class AuthRepository {
  Future<UserEntity> login(LoginRequestModel request);
  Future<bool> isLoggedIn();
}
