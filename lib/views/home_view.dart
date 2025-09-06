import 'package:finalproject/components/custom_button_nav_bar.dart';
import 'package:finalproject/widgets/category_grid_view.dart';
import 'package:finalproject/widgets/category_list.dart';
import 'package:finalproject/widgets/custom_appBar.dart';
import 'package:finalproject/widgets/custom_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8B74FE),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Gap(50),
            const CustomAppbar(),
            const Gap(30),
            const CustomProgressWidget(),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Users".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "View All".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const Gap(20),
            const CategoryList(),
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "More Categories".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "View All".tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Expanded(child: const CategoryGridView()),
          ],
        ),
      ),
      bottomNavigationBar: CustomButtonNavBar(),
    );
  }
}
