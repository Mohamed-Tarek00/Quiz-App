import 'package:finalproject/localization/arabic_translation.dart';
import 'package:finalproject/localization/english_translation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static const Locale fallbackLocale = Locale('en');
  static final Locale initialLocale =
      Get.deviceLocale?.languageCode == 'ar'
          ? const Locale('ar')
          : const Locale('en');

  @override
  Map<String, Map<String, String>> get keys => {
    'en': enTranslations,
    'ar': arTranslations,
  };

  static void switchLanguage() {
    Locale current = Get.locale ?? initialLocale;
    if (current.languageCode == 'en') {
      Get.updateLocale(const Locale('ar'));
    } else {
      Get.updateLocale(const Locale('en'));
    }
  }
}
