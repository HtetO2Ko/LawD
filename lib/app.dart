import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:law_diary/core/configs/theme/app_colors.dart';
import 'package:law_diary/core/configs/theme/app_theme.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_cubit.dart';
import 'package:law_diary/features/splash/presentation/splash_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.background),
    );
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => DrawerCubit(context))],
      child: MaterialApp(
        builder: FToastBuilder(),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme,
        title: 'Law Diary',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: SplashPage(),
      ),
    );
  }
}
