import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/core/usecase/usecase.dart';
import 'package:law_diary/features/auth/data/models/auth_req_params.dart';
import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';
import 'package:law_diary/features/auth/domain/repositories/auth_repo.dart';

class LoginUseCase extends UseCase<UserEntity, LoginRequestModel> {
  @override
  Future<UserEntity> call({LoginRequestModel? params}) async {
    return await sl<AuthRepository>().login(params!);
  }
}

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
