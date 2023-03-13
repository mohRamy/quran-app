import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';

import '../../../../config/routes/app_pages.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/widgets/custom_loader.dart';
import '../../domian/entities/surah.dart';

class BookmarkWidget extends GetView<HomeController> {
  const BookmarkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeController) => FutureBuilder<List<Map<String, dynamic>>>(
        future: homeController.getBookmark(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  "Bookmark box is Empty",
                  style: context.theme.textTheme.titleLarge,
                ),
              );
            }
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data = snapshot.data![index];
                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor:
                        Get.isDarkMode ? Colors.white : AppColors.origin,
                    child: Text("${index + 1}"),
                  ),
                  title: Text(
                    data['surah'],
                    //style: context.theme.textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    "Ayat ${data['ayat']} - via ${data['via']}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            );
          }
          return const CustomLoader();
        },
      ),
    );
  }
}
