import 'package:finalproject/providers/auth_provider.dart';
import 'package:finalproject/routes/app_routes_name.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:finalproject/utils/validator.dart';
import 'package:finalproject/widgets/Custom_button.dart';
import 'package:finalproject/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xff8B74FE),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Consumer<AuthProvider>(
              builder: (context, authProvider, child) {
                return Form(
                  key: authProvider.loginFormKey,
                  child: Column(
                    children: [
                      const Gap(100),
                      const Text(
                        "LOGO",
                        style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(30),
                      const Text(
                        "Welcome back!",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(15),
                      const Text(
                        "Log in to existing LOGO account",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(35),
                      CustomTextField(
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                        controller: authProvider.emailController,
                        validator: AuthValidators.validateEmail,
                      ),
                      const Gap(20),
                      CustomTextField(
                        hintText: 'Password',
                        icon: Icons.lock_outline,
                        controller: authProvider.passwordController,
                        isPassword: true,
                        validator: AuthValidators.validatePassword,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Gap(20),
                      authProvider.state == AuthState.loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : CustomButton(
                            message: 'Log In',
                            onTap: () => authProvider.login(context),
                          ),
                      const Gap(30),
                      GestureDetector(
                        onTap:
                            () => authProvider.navigateBetweenPages(
                              context,
                              pageName: AppRoutesName.signinRouteName,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Don’t have an account? ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
