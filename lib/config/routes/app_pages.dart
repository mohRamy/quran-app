import 'package:get/get.dart';
import 'package:quran_app/futures/introduction/presentaion/screen/introduction_screen.dart';
import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/presentatain/screen/detail_surah_screen.dart';
import 'package:quran_app/futures/surah/presentatain/screen/home_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = [
    GetPage(
      name: _Paths.introduction,
      page: () => const IntroductionScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.home,
      page: () =>  const HomeScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.detailSurah,
      page: () =>  DetailSurahScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
