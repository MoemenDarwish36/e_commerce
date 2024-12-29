import 'package:e_commerce_app/domain/entities/LoginResponseEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  Failures failures;

  LoginErrorState({required this.failures});
}

class LoginSuccessState extends LoginState {
  LoginResponseEntity loginResponseEntity;

  LoginSuccessState({required this.loginResponseEntity});
}
