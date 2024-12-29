import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/RegisterResponseEntity.dart';
import '../failures/failures.dart';
import '../repositories/auth_repository_contract/auth_repository_contract.dart';

@injectable
class RegisterUseCase {
  AuthRepositoryContract authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String confirmPassword, String phone) {
    return authRepository.register(
        name, email, password, confirmPassword, phone);
  }
}
