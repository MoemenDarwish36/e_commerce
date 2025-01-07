import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/home_screen_remote_data_source/home_screen_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/home_screen_repository_contract.dart';

@Injectable(as: HomeScreenRepositoryContract)
class HomeScreenRepositoryImpl implements HomeScreenRepositoryContract {
  HomeScreenRemoteDataSource remoteDataSource;

  HomeScreenRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, CategoryResponseEntity>> getAllCategories() async {
    var either = await remoteDataSource.getAllCategories();
    return either.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }

  @override
  Future<Either<Failures, BrandResponseEntity>> getAllBrands() async {
    var either = await remoteDataSource.getAllBrands();
    return either.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }
}
