import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:law_diary/app.dart';
import 'package:law_diary/core/di/service_locator.dart';
import 'package:law_diary/core/utils/storage/storage_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await StorageUtils.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en"), Locale("my")],
      path: "assets/langs",
      fallbackLocale: const Locale("en"),
      child: MyApp(),
    ),
  );
}
