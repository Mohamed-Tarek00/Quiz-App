import 'package:finalproject/components/upload_image.dart';
import 'package:finalproject/providers/auth_provider.dart';
import 'package:finalproject/routes/app_routes_name.dart';
import 'package:finalproject/utils/app_enums.dart';
import 'package:finalproject/utils/validator.dart';
import 'package:finalproject/widgets/Custom_button.dart';
import 'package:finalproject/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Form(
        key: authProvider.signinFormKey,
        child: Scaffold(
          backgroundColor: const Color(0xff8B74FE),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Gap(60),
                  const Center(
                    child: Text(
                      "Let’s Get Started!",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(7),
                  const Center(
                    child: Text(
                      "Create an account on quiz app to get all features",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Gap(20),
                  const UploadImage(),
                  const Gap(20),
                  CustomTextField(
                    hintText: "Name",
                    icon: Icons.person,
                    textType: TextInputType.name,
                    controller: authProvider.nameController,
                  ),
                  const Gap(28),
                  CustomTextField(
                    hintText: "Phone",
                    icon: Icons.phone,
                    textType: TextInputType.phone,
                    controller: authProvider.phonrController,
                  ),
                  const Gap(28),
                  CustomTextField(
                    hintText: "Email",
                    icon: Icons.email_outlined,
                    textType: TextInputType.emailAddress,
                    controller: authProvider.emailController,
                    validator: AuthValidators.validateEmail,
                  ),
                  const Gap(28),
                  CustomTextField(
                    hintText: "Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: authProvider.passwordController,
                    validator: AuthValidators.validatePassword,
                  ),
                  const Gap(28),
                  DropdownButtonFormField<String>(
                    initialValue: authProvider.selectedGender,
                    onChanged: (value) {
                      authProvider.selectedGender = value!;
                    },
                    items:
                        ["Male", "Female"].map((gender) {
                          return DropdownMenuItem<String>(
                            value: gender,
                            child: Text(gender),
                          );
                        }).toList(),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: const Color(0xff8B74FE),
                      ),
                      hintText: "Gender",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    validator: AuthValidators.validateGender,
                  ),
                  const Gap(33),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 76.0),
                    child:
                        authProvider.state == AuthState.loading
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : CustomButton(
                              message: "Create",
                              onTap: () => authProvider.register(context),
                            ),
                  ),
                  const Gap(30),
                  GestureDetector(
                    onTap:
                        () => authProvider.navigateBetweenPages(
                          context,
                          pageName: AppRoutesName.loginRouteName,
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Login ",
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
            ),
          ),
        ),
      ),
    );
  }
}
