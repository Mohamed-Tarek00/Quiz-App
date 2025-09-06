import 'package:auto_size_text/auto_size_text.dart';
import 'package:finalproject/services/app_size.dart';
import 'package:flutter/material.dart';

class AppAutoSizedText extends StatelessWidget {
  const AppAutoSizedText({
    super.key,
    required this.data,
    this.maxLines = 1,
    this.minFontSize = 12,
    this.textAlign = TextAlign.start,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w700,
    this.fontColor = Colors.white,
    required this.screenWidthPercentege,
  });

  final String data;
  final int maxLines;
  final double minFontSize;
  final TextAlign textAlign;
  final double fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final double screenWidthPercentege;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.getWidgetWidth(
        context: context,
        percantage: screenWidthPercentege,
      ),
      child: AutoSizeText(
        data,
        maxLines: maxLines,
        minFontSize: minFontSize,
        overflow: TextOverflow.ellipsis,
        textAlign: textAlign,
        style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
