import 'package:dartz/dartz.dart';
import 'package:quran_app/futures/surah/domian/entities/surah.dart';

import '../../../../core/error/failures.dart';
import '../repository/home_repository.dart';

class GetAllSurahUsecase {
  final HomeRepository baseHomeRepository;
  GetAllSurahUsecase(this.baseHomeRepository);

  Future<Either<Failure, List<Surah>>> call() async {
    return await baseHomeRepository.getAllSurah();
  }
}