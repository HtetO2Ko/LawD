import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:law_diary/core/configs/assets/app_images.dart';
import 'package:law_diary/core/utils/app_navigation.dart';
import 'package:law_diary/features/auth/presentation/login_page.dart';
import 'package:law_diary/features/diary/presentation/diary_list_page.dart';
import 'package:law_diary/features/splash/presentation/bloc/splash_cubit.dart';
import 'package:law_diary/features/splash/presentation/bloc/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashCubit()..appStarted(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is Authenticated) {
            AppNavigator.pushReplacement(context, DiaryListPage());
          } else if (state is UnAuthenticated) {
            AppNavigator.pushReplacement(context, LoginPage());
          }
        },
        child: Scaffold(
          body: Center(
            child: Image.asset(AppImages.splashImg, width: 150, height: 150),
          ),
          bottomNavigationBar: SizedBox(
            height: 100,
            child: SpinKitThreeBounce(color: Color(0xFF2C3E50), size: 20),
          ),
        ),
      ),
    );
  }
}
