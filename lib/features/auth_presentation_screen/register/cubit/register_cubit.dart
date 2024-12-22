import 'package:e_commerce_app/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterScreenCubit extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var confirmPasswordController = TextEditingController();

  var phoneController = TextEditingController();

  RegisterScreenCubit({required this.registerUseCase})
      : super(RegisterInitialState());

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        phoneController.text);
    either.fold(
        (ifLeft) => emit(RegisterErrorState(failures: ifLeft)),
        (ifRight) =>
            emit(RegisterSuccessState(registerResponseEntity: ifRight)));
  }
}
