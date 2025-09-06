import 'package:finalproject/components/custom_progress_bar.dart';
import 'package:finalproject/services/app_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class QuizProgress extends StatelessWidget {
  final double progress;

  const QuizProgress({super.key, required this.progress, required int current});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Progress",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
        ),
        const Gap(10),
        CustomProgressBar(
          width: AppSize.getWidgetWidth(context: context, percantage: .6),
          value: progress,
        ),
        const Gap(10),
        Text(
          "${(progress * 100).toStringAsFixed(0)}%",
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
