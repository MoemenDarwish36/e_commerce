import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';

abstract class AuthRepositoryContract {
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String confirmPassword, String phone);

  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password);
}
