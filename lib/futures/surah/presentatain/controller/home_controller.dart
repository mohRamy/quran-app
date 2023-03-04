import 'dart:async';

import 'package:get/get.dart';

import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_all_surah.dart';
import 'package:quran_app/futures/surah/domian/usecases/get_detail_surah.dart';

import '../../../../core/error/handle_error_loading.dart';
import '../../../../core/utils/app_component.dart';

class HomeController extends GetxController with HandleErrorLoading {
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

  late DetailSurah detailSurah;
  FutureOr<void> getDetailSurah(String surahId) async {
    showLoading();
    final result = await getDetailSurahUsecase(surahId);
    result.fold(
      (l) => AppComponent.showCustomSnackBar(l.message),
      (r) => detailSurah = r,
    );
    hideLoading();
    update();
  }
}