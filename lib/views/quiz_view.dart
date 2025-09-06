import 'package:finalproject/models/category_model.dart';
import 'package:finalproject/widgets/quiz_card.dart';
import 'package:flutter/material.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryModel category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    return Scaffold(
      backgroundColor: const Color(0xff8B74FE),
      body: Column(children: [QuizCard(category: category)]),
    );
  }
}
