import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repository/home_repository.dart';

class GetAllJuzUsecase {
  final HomeRepository baseHomeRepository;
  GetAllJuzUsecase(this.baseHomeRepository);

  Future<Either<Failure, List<Map<String, dynamic>>>> call() async {
    return await baseHomeRepository.getAllJuz();
  }
}