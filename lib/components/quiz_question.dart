import 'package:finalproject/components/app_auto_sized_text.dart';
import 'package:finalproject/models/result_model.dart';
import 'package:finalproject/services/app_size.dart';
import 'package:flutter/material.dart';

class QuizQuestion extends StatelessWidget {
  const QuizQuestion({
    super.key,
    required this.questions,
    required this.currentQuestion,
  });

  final List<ResultModel> questions;
  final int currentQuestion;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.getWidgethighet(context: context, percantage: .21),
      width: AppSize.getWidgetWidth(context: context, percantage: .9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 171, 143, 250).withOpacity(.8),
      ),
      child: Center(
        child: AppAutoSizedText(
          data: questions[currentQuestion].question ?? "No Question",
          screenWidthPercentege: .6,
          maxLines: 3,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
