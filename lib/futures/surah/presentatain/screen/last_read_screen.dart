import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/app_colors.dart';

class LastReadScreen extends StatelessWidget {
  const LastReadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quran App",
          style: context.theme.textTheme.titleLarge,
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.origin,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
