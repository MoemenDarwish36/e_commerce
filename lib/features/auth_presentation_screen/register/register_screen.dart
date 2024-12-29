import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/main_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  RegisterScreenCubit registerScreenCubit = getIt<RegisterScreenCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenCubit, RegisterState>(
      bloc: registerScreenCubit,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              posActionName: 'ok',
              title: "Error");
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: AppConstants.registerSuccess,
              posActionName: 'ok',
              title: 'success');
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(ImageAssets.authScreen),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  // Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  BuildTextField(
                    prefixIcon: const Icon(Icons.person),
                    backgroundColor: ColorManager.white,
                    hint: AppConstants.hintRegisterName,
                    textInputType: TextInputType.name,
                    // validation: AppValidators.validateFullName,
                    controller: registerScreenCubit.nameController,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                      prefixIcon: const Icon(Icons.numbers),
                      hint: AppConstants.hintRegisterMobil,
                      backgroundColor: ColorManager.white,
                      // validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                      controller: registerScreenCubit.phoneController),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                      prefixIcon: const Icon(Icons.email),
                      hint: AppConstants.hintRegisterEmail,
                      backgroundColor: ColorManager.white,
                      // validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                      controller: registerScreenCubit.emailController),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    prefixIcon: const Icon(Icons.password),
                    hint: AppConstants.hintRegisterPassword,
                    backgroundColor: ColorManager.white,
                    // validation: AppValidators.validatePassword,
                    controller: registerScreenCubit.passwordController,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: AppSize.s18.h,
                  ),
                  BuildTextField(
                    prefixIcon: const Icon(Icons.password),
                    hint: AppConstants.hintRegisterConfirmPassword,
                    backgroundColor: ColorManager.white,
                    // validation: (val) => AppValidators.validateConfirmPassword(
                    //     val, registerScreenCubit.passwordController.text),
                    controller: registerScreenCubit.confirmPasswordController,
                    isObscured: true,
                    textInputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: AppSize.s20.h,
                  ),
                  Center(
                    child: SizedBox(
                      height: AppSize.s60.h,
                      width: MediaQuery.of(context).size.width * .9,
                      child: CustomElevatedButton(
                        label: AppConstants.registerElevatedButton,
                        backgroundColor: ColorManager.primary,
                        textStyle: getBoldStyle(
                            color: ColorManager.white, fontSize: AppSize.s20),
                        onTap: () {
                          registerScreenCubit.register();
                          // Navigator.pushNamed(context, Routes.mainRoute);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
