import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';
import '../repositories/home_screen_repository_contract.dart';

@injectable
class AddToCartUseCase {
  HomeScreenRepositoryContract homeScreenRepository;

  AddToCartUseCase({required this.homeScreenRepository});

  Future<Either<Failures, AddToCartResponseEntity>> invoke(String productId) {
    return homeScreenRepository.addToCart(productId);
  }
}
