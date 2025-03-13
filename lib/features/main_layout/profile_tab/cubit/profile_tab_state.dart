import 'package:e_commerce_app/domain/entities/UpdateUserEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';

abstract class ProfileState {}

class ProfileTabInitialState extends ProfileState {}

class ProfileTabLoadingState extends ProfileState {}

class ProfileTabErrorState extends ProfileState {
  Failures failures;

  ProfileTabErrorState({required this.failures});
}

class ProfileTabSuccessState extends ProfileState {
  UpdateUserResponseEntity updateUserResponseEntity;

  ProfileTabSuccessState({required this.updateUserResponseEntity});
}
