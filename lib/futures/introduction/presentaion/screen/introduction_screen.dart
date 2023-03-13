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
              "Quran App",
              style: context.theme.textTheme.titleLarge,
            ),
            SizedBox(height: Dimensions.height15),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height10 * 10,
              ),
              child: Text(
                "Learn Quran and Recite once everyday",
                textAlign: TextAlign.center,
                style: context.theme.textTheme.titleMedium,
              ),
            ),
            SizedBox(height: Dimensions.height10 * 7),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.height20,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                child: Lottie.asset(
                    AppString.animationAsset,
                  ),
              ),
            ),
            SizedBox(height: Dimensions.height30),
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
