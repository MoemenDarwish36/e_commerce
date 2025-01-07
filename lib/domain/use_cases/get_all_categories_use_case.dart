import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/repositories/home_screen_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../entities/CategoryResponseEntity.dart';
import '../failures/failures.dart';

@injectable
class GetAllCategoriesUseCase {
  HomeScreenRepositoryContract homeScreenRepository;

  GetAllCategoriesUseCase({required this.homeScreenRepository});

  Future<Either<Failures, CategoryResponseEntity>> invoke() {
    return homeScreenRepository.getAllCategories();
  }
}
