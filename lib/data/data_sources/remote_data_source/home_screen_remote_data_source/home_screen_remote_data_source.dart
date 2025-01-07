import 'package:dartz/dartz.dart';

import '../../../../domain/entities/BrandResponseEntity.dart';
import '../../../../domain/entities/CategoryResponseEntity.dart';
import '../../../../domain/failures/failures.dart';

abstract class HomeScreenRemoteDataSource {
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories();

  Future<Either<Failures, BrandResponseEntity>> getAllBrands();
}
