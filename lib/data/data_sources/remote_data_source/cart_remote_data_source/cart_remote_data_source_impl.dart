import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/widget/shared_preference_utils.dart';
import 'package:e_commerce_app/data/model/GetCartResponseDto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/constant_manager.dart';
import '../../../../domain/failures/failures.dart';
import '../../../api_manager/api_manager.dart';
import 'cart_remote_data_source.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.getData(AppConstants.addToCart,
            headers: {'token': token.toString()});
        var getCartResponse = GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(getCartResponse);
        } else {
          return Left(ServerFailures(errorMessage: getCartResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.deleteData(
            "${AppConstants.addToCart}/$productId",
            headers: {'token': token.toString()});
        var deleteItemInCartResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(deleteItemInCartResponse);
        } else {
          return Left(
              ServerFailures(errorMessage: deleteItemInCartResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      String productId, int count) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.updateData(
            "${AppConstants.addToCart}/$productId",
            headers: {'token': token.toString()},
            body: {'count': count.toString()});
        var updateCartCountResponse =
            GetCartResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateCartCountResponse);
        } else {
          return Left(
              ServerFailures(errorMessage: updateCartCountResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
