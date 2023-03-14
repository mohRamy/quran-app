import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/core/utils/dimensions.dart';
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
                  style: TextStyle(
                    fontSize: Dimensions.font20,
                    color: Colors.grey,
                  ),
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
                  leading: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                      image: const AssetImage(
                        AppString.octagonalAsset,
                      ),
                      fit: BoxFit.cover,
                      color: AppColors.origin,
                      height: 35,
                      width: 35,
                    ),
                    Text(
                      "${index + 1}",
                    ),
                  ],
                ),
                  title: Text(
                    data['surah'].toString().replaceAll("+", "'"),
                  ),
                  subtitle: Text(
                    "Ayat ${data['ayat']} - via ${data['via']}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: IconButton(
            onPressed: () {
              homeController.deleteBookmark(data['id']);
            },
            icon: Icon(
              Icons.delete,
              color: AppColors.branch,
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
