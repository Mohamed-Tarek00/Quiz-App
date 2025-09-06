import 'package:finalproject/localization/arabic_translation.dart';
import 'package:finalproject/localization/english_translation.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': enTranslations,
    'ar': arTranslations,
  };
}
