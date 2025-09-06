import 'dart:io';

import 'package:finalproject/providers/auth_provider.dart';
import 'package:finalproject/services/app_size.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Column(
      children: [
        GestureDetector(
          onTap: authProvider.uploadImage,
          child: CircleAvatar(
            radius: AppSize.getWidgetWidth(context: context, percantage: .12),
            backgroundColor: Colors.grey.withOpacity(.4),
            backgroundImage:
                authProvider.selectedImage != null
                    ? FileImage(File(authProvider.selectedImage!.path))
                    : null,
            child:
                authProvider.selectedImage == null
                    ? Icon(Icons.image, size: 40, color: Colors.white)
                    : null,
          ),
        ),
        const Gap(20),
        authProvider.selectedImage == null
            ? SizedBox.shrink()
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Delete Button
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: BorderSide(color: Colors.red, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: authProvider.deleteImage,
                  icon: Icon(Icons.delete_outline, size: 20),
                  label: Text("Delete"),
                ),
                const Gap(12),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6D5DF6), Color(0xFF3D2BFA)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: authProvider.uploadImage,
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "Change Image",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
      ],
    );
  }
}
