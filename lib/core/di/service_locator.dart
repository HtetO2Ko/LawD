import 'package:get_it/get_it.dart';
import 'package:law_diary/core/network/dio_client.dart';

// Repos
import 'package:law_diary/features/auth/domain/repositories/auth_repo.dart';
import 'package:law_diary/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:law_diary/features/diary/domain/repositories/diary_repo.dart';
import 'package:law_diary/features/diary/data/repositories/diary_repo_impl.dart';

// Usecases
import 'package:law_diary/features/auth/domain/usecase/auth_usecase.dart';
import 'package:law_diary/features/diary/domain/usecase/diary_usecase.dart';

// Sources
import 'package:law_diary/features/auth/data/source/auth_source.dart';
import 'package:law_diary/features/diary/data/source/diary_source.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  // Repos
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<DiaryRepository>(DiaryRepoImpl());

  //// Usecases
  // Login Page
  sl.registerSingleton<LoginUseCase>(LoginUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<TokenUseCase>(TokenUseCase());
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase());
  // Diary List Page
  sl.registerSingleton<DiaryListUsecase>(DiaryListUsecase());

  //// Sources
  sl.registerSingleton<AuthSource>(AuthSourceImpl());
  sl.registerSingleton<DiarySource>(DiarySourceImpl());
}
