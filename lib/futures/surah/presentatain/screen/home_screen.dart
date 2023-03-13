import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/config/routes/app_pages.dart';
import 'package:quran_app/config/themes/theme_services.dart';
import 'package:quran_app/core/utils/app_colors.dart';
import 'package:quran_app/core/utils/app_strings.dart';
import 'package:quran_app/core/utils/dimensions.dart';
import 'package:quran_app/futures/surah/presentatain/components/bookmark_widget.dart';
import 'package:quran_app/futures/surah/presentatain/components/juz_widget.dart';
import 'package:quran_app/futures/surah/presentatain/components/surah_widget.dart';
import 'package:quran_app/futures/surah/presentatain/controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quran App",
          style: context.theme.textTheme.titleLarge,
        ),
        leading: Icon(
          Icons.menu,
          color: AppColors.origin,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: AppColors.origin,
            ),
          ),
          SizedBox(width: Dimensions.width20),
        ],
      ),
      body: DefaultTabController(
        length: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(Dimensions.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Asslamaulikum",
                    style: context.theme.textTheme.titleMedium,
                  ),
                  SizedBox(height: Dimensions.height10),
                  Text(
                    "Tanver Ahassan",
                    style: context.theme.textTheme.titleLarge!
                        .copyWith(fontSize: Dimensions.font26),
                  ),
                ],
              ),
            ),
            Card(
              child: InkWell(
                onTap: () => Get.toNamed(Routes.lastRead),
                borderRadius: BorderRadius.circular(Dimensions.radius15),
                splashColor: Colors.grey,
                child: Container(
                  // margin: EdgeInsets.all(Dimensions.height10),
                  padding: EdgeInsets.fromLTRB(
                    Dimensions.height20,
                    Dimensions.height20,
                    0.0,
                    Dimensions.height20,
                  ),
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(Dimensions.radius15),
                    gradient: AppColors.gradient,
                  ),
                  child: Stack(
                    children: [
                      const Positioned(
                        right: 0.0,
                        top: -50.0,
                        child: Image(
                          image: AssetImage(
                            AppString.quranAsset,
                          ),
                          fit: BoxFit.cover,
                          width: 240,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.menu_book_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(width: Dimensions.width10),
                              Text(
                                "Last Read",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.font16 + 2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Dimensions.height30),
                          Text(
                            "Al Fatiah",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Dimensions.font26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Jus 2 | Ayah 4",
                            style: TextStyle(
                              color: AppColors.branch,
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(
                  text: "Surah",
                ),
                Tab(
                  text: "Juz",
                ),
                Tab(
                  text: "Bookmark",
                ),
                Tab(
                  text: "Para",
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  SurahWidget(),
                  JuzWidget(),
                  BookmarkWidget(),
                  Text("pp"),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ModeTheme().changeTheme();
        },
        child: Icon(
          Icons.color_lens,
          color: Get.isDarkMode
              ? AppColors.backgroundLight
              : AppColors.backgroundDark,
        ),
      ),
    );
  }
}
