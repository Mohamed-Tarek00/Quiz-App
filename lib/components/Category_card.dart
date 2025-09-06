import 'package:finalproject/services/app_size.dart';
import 'package:finalproject/components/app_auto_sized_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Card(
            elevation: 10,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: AppSize.getWidgetWidth(
                      context: context,
                      percantage: .37,
                    ),
                    height: AppSize.getWidgetWidth(
                      context: context,
                      percantage: .35,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFCCBAFF).withOpacity(.5),
                    ),
                    child: Image.asset(
                      "assets/vecteezy_a-question-mark-icon-on-a-computer-screen_65977611.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const Gap(10),
                  AppAutoSizedText(
                    data: title,
                    fontColor: Colors.black,
                    screenWidthPercentege: .27,
                  ),
                  const Gap(5),
                  AppAutoSizedText(
                    data: "10 Questions",
                    fontColor: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    screenWidthPercentege: .3,
                  ),
                  const Gap(20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.crown,
                        color: Colors.amber.shade800,
                        size: 20,
                      ),
                      const Gap(8),
                      SizedBox(
                        width: AppSize.getWidgetWidth(
                          context: context,
                          percantage: .1,
                        ),
                        child: Text(
                          "24.7k",
                          style: TextStyle(
                            color: Colors.amber.shade800,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 17,
            right: 17,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.amber.shade800,
              child: const Icon(
                FontAwesomeIcons.bolt,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
