import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';

import '../../../../domain/entities/BrandResponseEntity.dart';
import '../../../../domain/entities/CategoryResponseEntity.dart';
import '../../../../domain/entities/ProductResponseEntity.dart';
import '../../../../domain/failures/failures.dart';

abstract class HomeScreenRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();
  Future<Either<Failures, BrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}
