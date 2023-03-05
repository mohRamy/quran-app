import 'dart:async';

import 'package:get/get.dart';

import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_all_surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_detail_surah.dart';

import '../../../../core/utils/app_component.dart';

class HomeController extends GetxController {
  final GetAllSurahUsecase getAllSurahUsecase;
  final GetDetailSurahUsecase getDetailSurahUsecase;

  HomeController({
    required this.getAllSurahUsecase,
    required this.getDetailSurahUsecase,
  });

  
  Future<List<Surah>> getAllSurah() async {
    final result = await getAllSurahUsecase();
    List<Surah> allSurah = [];
    result.fold(
      (l) => AppComponent.showCustomSnackBar(l.message),
      (r) => allSurah = r,
    );
    update();
    return allSurah;
  }

  
  Future<DetailSurah> getDetailSurah(String surahId) async {
    final result = await getDetailSurahUsecase(surahId);
    late DetailSurah detailSurah;
    result.fold(
      (l) => AppComponent.showCustomSnackBar(l.message),
      (r) => detailSurah = r,
    );
    update();
    return detailSurah;
  }
}