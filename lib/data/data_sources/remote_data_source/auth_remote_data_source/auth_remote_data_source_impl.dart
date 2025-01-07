import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:e_commerce_app/data/api_manager/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/data/model/LoginResponseDto.dart';
import 'package:e_commerce_app/data/model/RegisterResponseDto.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          AppConstants.apiRegister,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": confirmPassword,
            "phone": phone
          },
        );
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerFailures(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseDto>> login(
      String email, String password) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          AppConstants.apiLogin,
          body: {
            "email": email,
            "password": password,
          },
        );
        var loginResponse = LoginResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerFailures(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
