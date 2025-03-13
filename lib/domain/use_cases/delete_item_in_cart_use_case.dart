import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures/failures.dart';
import '../repositories/cart_repository_contract.dart';

@injectable
class DeleteItemInCartUseCase {
  CartRepositoryContract cartRepositoryContract;

  DeleteItemInCartUseCase({required this.cartRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke(String productId) {
    return cartRepositoryContract.deleteItemInCart(productId);
  }
}
