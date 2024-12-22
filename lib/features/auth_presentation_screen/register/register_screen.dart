import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/register/cubit/register_cubit.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widget/custom_elevated_button.dart';
import '../../../core/widget/main_text_field.dart';
import '../../../core/widget/validators.dart';

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
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      backgroundColor: ColorManager.white,
                      hint: AppConstants.hintRegisterName,
                      label: AppConstants.labelRegisterName,
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                      controller: registerScreenCubit.nameController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                        hint: AppConstants.hintRegisterMobil,
                        backgroundColor: ColorManager.white,
                        label: AppConstants.labelRegisterMobil,
                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                        controller: registerScreenCubit.phoneController),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                        hint: AppConstants.hintRegisterEmail,
                        backgroundColor: ColorManager.white,
                        label: AppConstants.labelRegisterEmail,
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                        controller: registerScreenCubit.emailController),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: AppConstants.hintRegisterPassword,
                      backgroundColor: ColorManager.white,
                      label: AppConstants.labelRegisterPassword,
                      validation: AppValidators.validatePassword,
                      controller: registerScreenCubit.passwordController,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: AppConstants.hintRegisterConfirmPassword,
                      backgroundColor: ColorManager.white,
                      label: AppConstants.labelRegisterConfirmPassword,
                      validation: (val) =>
                          AppValidators.validateConfirmPassword(
                              val, registerScreenCubit.passwordController.text),
                      controller: registerScreenCubit.confirmPasswordController,
                      isObscured: true,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery.of(context).size.width * .9,
                        child: CustomElevatedButton(
                          label: AppConstants.registerElevatedButton,
                          backgroundColor: ColorManager.white,
                          textStyle: getBoldStyle(
                              color: ColorManager.primary,
                              fontSize: AppSize.s20),
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
      ),
    );
  }
}
