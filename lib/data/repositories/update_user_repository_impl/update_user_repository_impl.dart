import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/UpdateUserEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';
import 'package:e_commerce_app/domain/repositories/update_user_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../../data_sources/remote_data_source/update_user_remote_date_source/update_user_remote_date_source.dart';

@Injectable(as: UpdateUserRepositoryContract)
class UpdateUserRepositoryImpl implements UpdateUserRepositoryContract {
  UpdateUserDateSource updateUserDateSource;

  UpdateUserRepositoryImpl({required this.updateUserDateSource});

  @override
  Future<Either<Failures, UpdateUserResponseEntity>> updateUser(
      String name, String email, String phone) async {
    var either = await updateUserDateSource.updateUser(name, email, phone);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
