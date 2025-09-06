import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finalproject/providers/auth_provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.validator,
    this.textType = TextInputType.text,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputType? textType;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: textType,
          obscureText: isPassword ? !authProvider.isPasswordVisible : false,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Icon(icon, color: const Color(0xff8B74FE)),
            ),
            suffixIcon:
                isPassword
                    ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GestureDetector(
                        onTap: authProvider.togglePasswordVisibility,
                        child: Icon(
                          authProvider.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xff8B74FE),
                        ),
                      ),
                    )
                    : null,
            hintText: hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff515151),
            ),
            filled: true,
            fillColor: const Color(0xffF2F2F2),
            border: const OutlineInputBorder(),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF2F2F2)),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffF2F2F2)),
            ),
          ),
        );
      },
    );
  }
}
