import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/UpdateUserEntity.dart';
import 'package:e_commerce_app/domain/repositories/update_user_repository_contract.dart';
import 'package:injectable/injectable.dart';

import '../failures/failures.dart';

@injectable
class UpdateUserUseCase {
  UpdateUserRepositoryContract updateUserRepository;

  UpdateUserUseCase({required this.updateUserRepository});

  Future<Either<Failures, UpdateUserResponseEntity>> invoke(
      String name, String email, String phone) {
    return updateUserRepository.updateUser(name, email, phone);
  }
}
