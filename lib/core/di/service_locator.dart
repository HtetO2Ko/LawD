import 'package:get_it/get_it.dart';
import 'package:law_diary/core/network/dio_client.dart';

// Repos
import 'package:law_diary/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:law_diary/features/auth/domain/repositories/auth_repo.dart';

// Usecases
import 'package:law_diary/features/auth/domain/usecase.dart/auth_usecase.dart';

// Sources
import 'package:law_diary/features/auth/data/source/auth_source.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Repos
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //// Usecases
  // Login Page
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<TokenUseCase>(TokenUseCase());
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase());

  //// Sources
  sl.registerSingleton<AuthSource>(AuthSourceImpl());
}
