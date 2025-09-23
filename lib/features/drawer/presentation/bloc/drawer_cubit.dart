import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/features/auth/domain/entities/auth_entities.dart';
import 'package:law_diary/features/auth/domain/usecase/auth_usecase.dart';
import 'package:law_diary/features/drawer/presentation/bloc/drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit(BuildContext context)
    : super(DrawerChanges(currentLang: context.locale.toString()));

  void changeLanguage(String langCode, BuildContext context) {
    emit(DrawerChanges(currentLang: langCode));
    context.setLocale(Locale(langCode));
  }

  Future<UserEntity> getUserData() async {
    final UserEntity userData = await sl<LoginUserUseCase>().call();
    return userData;
  }
}
