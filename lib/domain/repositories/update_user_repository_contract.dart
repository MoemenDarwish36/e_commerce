import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/UpdateUserEntity.dart';

import '../failures/failures.dart';

abstract class UpdateUserRepositoryContract {
  Future<Either<Failures, UpdateUserResponseEntity>> updateUser(
      String name, String email, String phone);
}
