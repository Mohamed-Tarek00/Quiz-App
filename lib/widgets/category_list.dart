import 'package:finalproject/providers/top_Users_provider.dart';
import 'package:finalproject/routes/app_routes_name.dart';
import 'package:finalproject/services/app_size.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<TopUsersProvider>(context, listen: false).getTopUsers(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TopUsersProvider>(context);

    if (provider.state == AppState.loading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.state == AppState.error) {
      return Center(child: Text("Error: ${provider.errMessage}"));
    }

    if (provider.state == AppState.emptyData) {
      return const Center(child: Text("No top users found."));
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(provider.users.length, (index) {
          final user = provider.users[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: GestureDetector(
              onTap:
                  () => Navigator.pushNamed(
                    context,
                    AppRoutesName.userDetailsRouteName,
                    arguments: user,
                  ),
              child: Column(
                children: [
                  Container(
                    width: AppSize.getWidgetWidth(
                      context: context,
                      percantage: .18,
                    ),
                    height: AppSize.getWidgetWidth(
                      context: context,
                      percantage: .18,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                      color: const Color(0xFFCCBAFF).withOpacity(.7),
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Gap(5),
                  Text(
                    user.userName ?? "User",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
