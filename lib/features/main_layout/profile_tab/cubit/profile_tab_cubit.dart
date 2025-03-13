import 'package:e_commerce_app/domain/use_cases/update_user_use_case.dart';
import 'package:e_commerce_app/features/main_layout/profile_tab/cubit/profile_tab_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileTabScreenCubit extends Cubit<ProfileState> {
  UpdateUserUseCase updateUserUseCase;
  bool isTextReadOnly = true;
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  ProfileTabScreenCubit({required this.updateUserUseCase})
      : super(ProfileTabInitialState());

  static ProfileTabScreenCubit get(context) => BlocProvider.of(context);

  void updateUser() async {
    emit(ProfileTabLoadingState());
    var either = await updateUserUseCase.invoke(
        nameController.text, emailController.text, phoneController.text);
    either.fold(
        (error) => emit(ProfileTabErrorState(failures: error)),
        (response) =>
            emit(ProfileTabSuccessState(updateUserResponseEntity: response)));
  }
}
