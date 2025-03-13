import 'package:dartz/dartz.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures/failures.dart';

abstract class CartRepositoryContract {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
