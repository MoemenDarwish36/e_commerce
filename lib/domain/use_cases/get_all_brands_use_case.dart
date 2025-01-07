import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/BrandResponseEntity.dart';
import '../failures/failures.dart';
import '../repositories/home_screen_repository_contract.dart';

@injectable
class GetAllBrandsUseCase {
  HomeScreenRepositoryContract homeScreenRepository;

  GetAllBrandsUseCase({required this.homeScreenRepository});

  Future<Either<Failures, BrandResponseEntity>> invoke() {
    return homeScreenRepository.getAllBrands();
  }
}
