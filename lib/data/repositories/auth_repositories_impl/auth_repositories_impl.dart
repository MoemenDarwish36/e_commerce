import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/data/data_sources/remote_data_source/auth_remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/RegisterResponseEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repositories/auth_repository_contract/auth_repository_contract.dart';

@Injectable(as: AuthRepositoryContract)
class AuthRepositoriesImpl implements AuthRepositoryContract {
  AuthRemoteDataSource remoteDataSource;

  AuthRepositoriesImpl({required this.remoteDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
      String name,
      String email,
      String password,
      String confirmPassword,
      String phone) async {
    var either = await remoteDataSource.register(
        name, email, password, confirmPassword, phone);
    return either.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(
      String email, String password) async {
    var either = await remoteDataSource.login(email, password);
    return either.fold((ifLeft) => Left(ifLeft), (ifRight) => Right(ifRight));
  }
}
