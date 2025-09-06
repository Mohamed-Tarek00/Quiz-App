import 'package:finalproject/providers/quiz_main_provider.dart';
import 'package:finalproject/components/Category_card.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<QuizMainProvider>(context, listen: false);
      provider.fetchCategories();
    });
    return Consumer<QuizMainProvider>(
      builder: (BuildContext context, value, Widget? child) {
        if (value.appState == AppState.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (value.appState == AppState.emptyData) {
          return Center(child: Text("No Categories to Display"));
        } else if (value.appState == AppState.error) {
          return Center(child: Text(value.errMesage));
        } else {
          return GridView.builder(
            itemCount: value.categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.68,
            ),
            itemBuilder: (BuildContext context, int index) {
              final category = value.categories[index];
              return GestureDetector(
                onTap: () {
                  value.resetQuiz();
                  value.pushMethod(context, category);
                },
                child: CategoryCard(title: category.name!),
              );
            },
          );
        }
      },
    );
  }
}
