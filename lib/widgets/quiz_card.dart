import 'package:finalproject/components/quiz_answers.dart';
import 'package:finalproject/components/quiz_footer.dart';
import 'package:finalproject/components/quiz_progress.dart';
import 'package:finalproject/components/quiz_question.dart';
import 'package:finalproject/models/category_model.dart';
import 'package:finalproject/providers/quiz_main_provider.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:finalproject/widgets/quiz_appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class QuizCard extends StatefulWidget {
  const QuizCard({super.key, required this.category});
  final CategoryModel category;

  @override
  State<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends State<QuizCard> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final category =
        ModalRoute.of(context)!.settings.arguments as CategoryModel;
    final provider = Provider.of<QuizMainProvider>(context, listen: false);
    provider.fetchQuestions(category.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizMainProvider>(
      builder: (BuildContext context, value, Widget? child) {
        if (value.appState == AppState.loading || value.questions.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (value.appState == AppState.emptyData) {
          return const Center(child: Text("No Questions Available"));
        } else if (value.appState == AppState.error) {
          return Center(child: Text(value.errMesage));
        }

        if (value.currentQuestion >= value.questions.length) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const Gap(45),
            QuizAppbar(
              currentQuestion: value.currentQuestion,
              totalQuestions: value.questions.length,
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      QuizQuestion(
                        questions: value.questions,
                        currentQuestion: value.currentQuestion,
                      ),
                      const Gap(30),
                      QuizAnswers(
                        key: ValueKey(value.currentQuestion),
                        answers:
                            value.questions[value.currentQuestion].allAnswers!,
                        onAnswerSelected:
                            (selectedAnswer) => value.handleAnswer(
                              selectedAnswer,
                              context: context,
                            ),
                      ),
                      const Gap(30),
                      QuizProgress(
                        current: value.currentQuestion + 1,
                        progress:
                            (value.currentQuestion + 1) /
                            value.questions.length,
                      ),
                      const Gap(100),
                      const QuizFooter(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
