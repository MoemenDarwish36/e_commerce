import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/api_manager/api_manager.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/update_user_remote_date_source/update_user_remote_date_source.dart';
import 'package:e_commerce_app/data/model/UpdateUserResponseDto.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/constant_manager.dart';
import '../../../../core/widget/shared_preference_utils.dart';
import '../../../../domain/failures/failures.dart';

@Injectable(as: UpdateUserDateSource)
class UpdateUserDateSourceImpl implements UpdateUserDateSource {
  ApiManager apiManager;

  UpdateUserDateSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, UpdateUserResponseDto>> updateUser(
      String name, String email, String phone) async {
    try {
      var checkResult = await Connectivity().checkConnectivity();
      if (checkResult.contains(ConnectivityResult.wifi) ||
          checkResult.contains(ConnectivityResult.mobile)) {
        var token = SharedPreferenceUtils.getData(key: 'token');
        var response = await apiManager.updateData(AppConstants.updateUser,
            headers: {'token': token.toString()},
            body: {"name": name, "email": email, "phone": phone});
        var updateUserResponse = UpdateUserResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(updateUserResponse);
        } else {
          return Left(
              ServerFailures(errorMessage: updateUserResponse.message!));
        }
      } else {
        return Left(NetworkFailures(errorMessage: AppConstants.networkError));
      }
    } catch (e) {
      return Left(Failures(errorMessage: e.toString()));
    }
  }
}
