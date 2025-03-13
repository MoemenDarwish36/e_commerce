import 'package:dartz/dartz.dart';

import '../../../../domain/entities/UpdateUserEntity.dart';
import '../../../../domain/failures/failures.dart';

abstract class UpdateUserDateSource {
  Future<Either<Failures, UpdateUserResponseEntity>> updateUser(
      String name, String email, String phone);
}
