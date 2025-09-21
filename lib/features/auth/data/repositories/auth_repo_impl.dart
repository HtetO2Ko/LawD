import 'package:law_diary/core/constants/storage_keys.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/core/utils/secure_storage_utils.dart';
import 'package:law_diary/features/auth/data/models/auth_req_params.dart';
import 'package:law_diary/features/auth/data/source/auth_source.dart';
import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';
import 'package:law_diary/features/auth/domain/repositories/auth_repo.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<UserEntity> login(LoginRequestModel params) async {
    var data = await sl<AuthSource>().login(params);
    return data;
  }

  @override
  Future<bool> isLoggedIn() async {
    String token = await SecureStorageUtils.getString(StorageKeys.token);
    if (token == '') {
      return false;
    } else {
      return true;
    }
  }
}
