import 'package:e_commerce_app/domain/use_cases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'login_state.dart';

@injectable
class LoginScreenCubit extends Cubit<LoginState> {
  LoginUseCase loginUseCase;

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  LoginScreenCubit({required this.loginUseCase}) : super(LoginInitialState());

  void login() async {
    emit(LoginLoadingState());
    var either = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    either.fold((ifLeft) => emit(LoginErrorState(failures: ifLeft)),
        (ifRight) => emit(LoginSuccessState(loginResponseEntity: ifRight)));
  }
}
