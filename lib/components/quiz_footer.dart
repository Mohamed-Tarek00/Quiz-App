import 'package:finalproject/services/app_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class QuizFooter extends StatefulWidget {
  const QuizFooter({super.key});

  @override
  State<QuizFooter> createState() => _QuizFooterState();
}

class _QuizFooterState extends State<QuizFooter> {
  List<Map<String, dynamic>> footers = [
    {"name": "Answers", "icon": Icons.mark_as_unread},
    {"name": "Audinace", "icon": Icons.group},
    {"name": "Add Time", "icon": Icons.timer},
    {"name": "Skip", "icon": Icons.double_arrow_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(footers.length, (index) {
        return Container(
          width: AppSize.getWidgetWidth(context: context, percantage: .18),
          height: AppSize.getWidgetWidth(context: context, percantage: .16),
          decoration: BoxDecoration(
            color: Colors.amber.shade900,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(footers[index]["icon"], color: Colors.white, size: 20),
                Gap(5),
                Text(
                  footers[index]["name"].toString().tr,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
