import 'package:finalproject/components/custom_progress_bar.dart';
import 'package:finalproject/services/app_size.dart';
import 'package:finalproject/components/app_auto_sized_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomProgressWidget extends StatelessWidget {
  const CustomProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFCCBAFF).withOpacity(.7),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: AppSize.getWidgetWidth(context: context, percantage: .35),
            height: AppSize.getWidgetWidth(context: context, percantage: .35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300.withOpacity(.3),
            ),
          ),
          const Gap(10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: AppAutoSizedText(
                      data: "Daily Tasks".tr,
                      fontSize: 16,
                      screenWidthPercentege: .15,
                    ),
                    subtitle: Text(
                      "14 questions".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.group, color: Colors.indigo),
                    ),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomProgressBar(value: .6),
                      const Gap(6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Progress".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "9/14".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
