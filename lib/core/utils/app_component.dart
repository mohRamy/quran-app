import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dimensions.dart';
import '../widgets/widgets.dart';

import 'app_colors.dart';

class AppComponent {
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void showCustomSnackBar(
    String message, {
    bool isError = true,
    String title = 'Error',
    Color color = Colors.redAccent,
  }) {
    Get.snackbar(
      title,
      message,
      titleText: Text(title),
      messageText: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
    );
  }

  static InkWell buildbottomsheet({
    required Icon icon,
    required String label,
    required Function() ontap,
  }) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(Dimensions.height10),
        height: Dimensions.height45,
        color: Get.isDarkMode ? AppColors.subBackgroundDark : AppColors.subBackgroundLight,
        child: Row(
          children: [
            icon,
            SizedBox(width: Dimensions.width10),
            TextCustom(text: label),
          ],
        ),
      ),
    );
  }
}
