import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuizAnswers extends StatefulWidget {
  final List<String> answers;
  final void Function(String) onAnswerSelected;

  const QuizAnswers({
    super.key,
    required this.answers,
    required this.onAnswerSelected,
  });

  @override
  State<QuizAnswers> createState() => _QuizAnswersState();
}

class _QuizAnswersState extends State<QuizAnswers> {
  int? selectedIndex;
  bool isAnswered = false;

  @override
  void didUpdateWidget(covariant QuizAnswers oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.answers != widget.answers) {
      selectedIndex = null;
      isAnswered = false;
    }
  }

  void selectAnswer(int index) {
    if (isAnswered) return;

    setState(() {
      selectedIndex = index;
      isAnswered = true;
    });

    widget.onAnswerSelected(widget.answers[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.answers.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6),
          child: GestureDetector(
            onTap: () => selectAnswer(index),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 16,
              ),
              decoration: BoxDecoration(
                color:
                    selectedIndex == index
                        ? Colors.greenAccent.withOpacity(.6)
                        : Colors.white,
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text(
                    String.fromCharCode(65 + index),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    widget.answers[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade400),
                      color:
                          selectedIndex == index ? Colors.green : Colors.white,
                    ),
                    child: const Icon(
                      FontAwesomeIcons.check,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
