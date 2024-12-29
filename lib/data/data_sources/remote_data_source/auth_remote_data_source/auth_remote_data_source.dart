import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';

import '../../../../domain/entities/LoginResponseEntity.dart';
import '../../../../domain/failures/failures.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String confirmPassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
