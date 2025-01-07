import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:e_commerce_app/data/api_manager/api_manager.dart';
import 'package:e_commerce_app/data/model/CategoryResponseDto.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../model/BrandResponseDto.dart';
import 'home_screen_remote_data_source.dart';

@Injectable(as: HomeScreenRemoteDataSource)
class HomeScreenRemoteDataSourceImpl implements HomeScreenRemoteDataSource {
  ApiManager apiManager;

  HomeScreenRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryResponseDto>> getAllCategories() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(AppConstants.getAllCategories);
        var categoryResponse = CategoryResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerFailures(errorMessage: categoryResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, BrandResponseDto>> getAllBrands() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.getData(AppConstants.getAllBrands);
        var brandResponse = BrandResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerFailures(errorMessage: brandResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
