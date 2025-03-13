import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/cart_remote_data_source/cart_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/repositories/cart_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/failures/failures.dart';

@Injectable(as: CartRepositoryContract)
class CartRepositoryImpl implements CartRepositoryContract {
  CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await remoteDataSource.getCart();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    var either = await remoteDataSource.deleteItemInCart(productId);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      String productId, int count) async {
    var either = await remoteDataSource.updateCountInCart(productId, count);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
