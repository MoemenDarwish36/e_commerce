import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../repositories/home_screen_repository_contract.dart';

@injectable
class GetAllProductsUseCase {
  HomeScreenRepositoryContract homeScreenRepository;

  GetAllProductsUseCase({required this.homeScreenRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeScreenRepository.getAllProducts();
  }
}
