import 'package:flutter/cupertino.dart';

class AppSize {
  static double getWidgetWidth({
    double percantage = 1,
    required BuildContext context,
  }) {
    return MediaQuery.of(context).size.width * percantage;
  }

  static double getWidgethighet({
    double percantage = 1,
    required BuildContext context,
  }) {
    return MediaQuery.of(context).size.height * percantage;
  }
}
