import 'package:finalproject/providers/auth_provider.dart';
import 'package:finalproject/providers/quiz_main_provider.dart';
import 'package:finalproject/providers/top_Users_provider.dart';
import 'package:finalproject/routes/app_routes.dart';
import 'package:finalproject/routes/app_routes_name.dart';
import 'package:finalproject/services/translation_service.dart';
import 'package:finalproject/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<QuizMainProvider>(
          create: (_) => QuizMainProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<TopUsersProvider>(
          create: (_) => TopUsersProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Quiz App',
        translations: TranslationService(),
        locale: TranslationService.initialLocale,
        fallbackLocale: TranslationService.fallbackLocale,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutesName.initialRouteName,
        routes: AppRoutes.routes,
        home: const HomeView(),
      ),
    );
  }
}
