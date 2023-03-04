import 'package:dartz/dartz.dart';
import 'package:quran_app/futures/surah/domian/entities/details_surah.dart';

import '../../../../core/error/failures.dart';
import '../repository/home_repository.dart';

class GetDetailSurahUsecase {
  final HomeRepository baseHomeRepository;
  GetDetailSurahUsecase(this.baseHomeRepository);

  Future<Either<Failure, DetailSurah>> call(String surahId) async {
    return await baseHomeRepository.getDetailSurah(surahId);
  }
}