import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/LoginResponseEntity.dart';
import '../failures/failures.dart';
import '../repositories/auth_repository_contract/auth_repository_contract.dart';

@injectable
class LoginUseCase {
  AuthRepositoryContract authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginResponseEntity>> invoke(
      String email, String password) {
    return authRepository.login(email, password);
  }
}
