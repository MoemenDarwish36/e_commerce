import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entities/RegisterResponseEntity.dart';
import '../failures/failures.dart';
import '../repositories/auth_repository_contract/auth_repository_contract.dart';

@injectable
class RegisterUseCase {
  AuthRepositoryContract registerRepository;

  RegisterUseCase({required this.registerRepository});

  Future<Either<Failures, RegisterResponseEntity>> invoke(String name,
      String email, String password, String confirmPassword, String phone) {
    return registerRepository.register(
        name, email, password, confirmPassword, phone);
  }
}
