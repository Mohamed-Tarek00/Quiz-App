import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomButtonNavBar extends StatefulWidget {
  const CustomButtonNavBar({super.key});

  @override
  State<CustomButtonNavBar> createState() => _CustomButtonNavBarState();
}

class _CustomButtonNavBarState extends State<CustomButtonNavBar> {
  List<Map<String, dynamic>> footer = [
    {"name": "Explore", "icons": Icons.home_outlined},
    {"name": "Leadboard", "icons": FontAwesomeIcons.trophy},
    {"name": "Bookmarks", "icons": Icons.book_outlined},
    {"name": "Settings", "icons": Icons.settings_outlined},
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
        color: Colors.white,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(footer.length, (index) {
          return GestureDetector(
            onTap: () {
              selectedIndex = index;
              setState(() {});
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                selectedIndex == index
                    ? CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.amber.shade900,
                      child: Icon(
                        footer[index]["icons"],
                        color: Colors.grey.shade200,
                        size: 30,
                      ),
                    )
                    : Icon(
                      footer[index]["icons"],
                      color: Colors.grey.shade400,
                      size: 30,
                    ),
                const Gap(10),
                Text(
                  footer[index]["name"].toString().tr,
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
