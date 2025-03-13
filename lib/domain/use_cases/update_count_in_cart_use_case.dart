import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures/failures.dart';
import '../repositories/cart_repository_contract.dart';

@injectable
class UpdateCountInCartUseCase {
  CartRepositoryContract cartRepositoryContract;

  UpdateCountInCartUseCase({required this.cartRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(
      String productId, int count) {
    return cartRepositoryContract.updateCountInCart(productId, count);
  }
}
