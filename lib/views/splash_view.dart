import 'package:finalproject/providers/auth_provider.dart';
import 'package:finalproject/services/app_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(
      context,
      listen: false,
    ).handleSplashLogic(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8B74FE),
      body: Center(
        child: Image.asset(
          "assets/vecteezy_quiz-sign-mark-free-png_27765346.png",
          width: AppSize.getWidgetWidth(context: context, percantage: .7),
        ),
      ),
    );
  }
}
