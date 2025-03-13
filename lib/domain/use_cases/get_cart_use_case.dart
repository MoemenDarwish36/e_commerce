import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/GetCartResponseEntity.dart';
import '../failures/failures.dart';
import '../repositories/cart_repository_contract.dart';

@injectable
class GetCartUseCase {
  CartRepositoryContract cartRepositoryContract;

  GetCartUseCase({required this.cartRepositoryContract});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepositoryContract.getCart();
  }
}
