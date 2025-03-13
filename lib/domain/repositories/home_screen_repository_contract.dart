import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';

abstract class HomeScreenRepositoryContract {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();
  Future<Either<Failures, BrandResponseEntity>> getAllBrands();

  Future<Either<Failures, ProductResponseEntity>> getAllProducts();

  Future<Either<Failures, AddToCartResponseEntity>> addToCart(String productId);
}
