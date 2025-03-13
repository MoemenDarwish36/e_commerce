import 'package:dartz/dartz.dart';

import '../../../../domain/entities/GetCartResponseEntity.dart';
import '../../../../domain/failures/failures.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failures, GetCartResponseEntity>> getCart();

  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId);

  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count);
}
