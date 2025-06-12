import 'package:feature/session/LocalSessionImpl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ios_app/common/user/UserSessionConst.dart';
import 'package:my_ios_app/config/appData/AppConfiguration.dart';
import 'package:my_ios_app/presentation/translation.dart';

class AppDefaultLocale {
  static Locale getAppLocale = AppConfiguration.forceLocale ??
      Get.locale ?? Get.deviceLocale ?? MamakTranslation.locales.first;
  static Locale fallBackLocale = AppConfiguration.forceLocale ?? MamakTranslation.locales.first;
  static List<Locale> supportedLocale = MamakTranslation.locales;
  static List<LocalizationsDelegate> localizationDelegate = const [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static Future<Locale> setLocaleFromSession() async {
    var currentLang =
        await GetIt.I.get<LocalSessionImpl>().getData(UserSessionConst.lang);
    return AppConfiguration.forceLocale ?? MamakTranslation.languages
            .firstWhereOrNull((lang) => lang.getCountryName == currentLang)
            ?.locale() ??
        getAppLocale;
  }
}
