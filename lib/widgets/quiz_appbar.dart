import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class QuizAppbar extends StatelessWidget {
  const QuizAppbar({
    super.key,
    required this.currentQuestion,
    required this.totalQuestions,
  });

  final int currentQuestion;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Gap(10),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(FontAwesomeIcons.arrowLeft, size: 20),
          ),
        ),
        const Spacer(),
        Text(
          'Question @current/@total'.trParams({
            'current': (currentQuestion + 1).toString(),
            'total': totalQuestions.toString(),
          }),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 19,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        const CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.bookmark_border),
        ),
        const Gap(10),
      ],
    );
  }
}
