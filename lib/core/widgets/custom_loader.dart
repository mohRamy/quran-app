import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/dimensions.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Center(
        child: Container(
          height: Dimensions.height20 * 4,
          width: Dimensions.height20 * 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.height20 * 5 / 2),
              gradient: AppColors.gradient),
          alignment: Alignment.center,
          child: const CircularProgressIndicator.adaptive(
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
