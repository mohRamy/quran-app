import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quran_app/config/routes/app_pages.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/dimensions.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Al-Quran Apps",
              style: TextStyle(
                fontSize: Dimensions.font26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Dimensions.height20),
            Text(
              "The Holy Quran with translation into English",
              style: TextStyle(
                fontSize: Dimensions.font16,
              ),
            ),
            SizedBox(height: Dimensions.height20),
            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset(
                AppString.animationQuran,
              ),
            ),
            SizedBox(height: Dimensions.height45),
            ElevatedButton(
              onPressed: ()=> Get.offAllNamed(Routes.home),
              child: const Text("Get Stated"),
            ),
          ],
        ),
      ),
    );
  }
}
