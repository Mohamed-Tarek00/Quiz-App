
import 'dart:io';

import 'package:finalproject/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:finalproject/components/app_auto_sized_text.dart';
import 'package:finalproject/services/translation_service.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage:
              user?.userImage != null
                  ? FileImage(File(user!.userImage!))
                  : AssetImage(
                        user?.isMale == true
                            ? "assets/male.png"
                            : "assets/female.png",
                      )
                      as ImageProvider,
          backgroundColor: Colors.grey[200],
        ),

        const Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: AppAutoSizedText(
                minFontSize: 20,
                data: user?.userName ?? "Guest",
                screenWidthPercentege: .3,
              ),
            ),
            const Gap(5),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade100.withOpacity(.3),
              ),
              child: Text(
                (user?.totalQuizsCompelete ?? 0) > 5
                    ? "Experts".tr
                    : "Beginner".tr,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Provider.of<AuthProvider>(context, listen: false).logout(context);
          },
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: Icon(Icons.logout_outlined, color: Colors.red, size: 35),
          ),
        ),
        Gap(10),
        GestureDetector(
          onTap: () => TranslationService.switchLanguage(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.translate_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const Gap(15),
                Text(
                  "${user?.totalCorrectAnswers ?? 0}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
