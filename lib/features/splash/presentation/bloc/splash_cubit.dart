import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/features/auth/domain/usecase.dart/auth_usecase.dart';
import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    final isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
