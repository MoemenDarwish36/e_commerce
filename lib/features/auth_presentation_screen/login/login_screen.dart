import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:e_commerce_app/core/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widget/main_text_field.dart';
import 'package:e_commerce_app/di/di.dart';
import 'package:e_commerce_app/features/auth_presentation_screen/login/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routes_manger/routes.dart';
import '../../../core/widget/dialog_utils.dart';
import '../../../core/widget/validators.dart';
import 'cubit/login_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreenCubit loginScreenCubit = getIt<LoginScreenCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginScreenCubit, LoginState>(
      bloc: loginScreenCubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              posActionName: 'ok',
              title: "Error");
        } else if (state is LoginSuccessState) {
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
                Text(
                  AppConstants.welcomeMessage,
                  style: getBoldStyle(color: ColorManager.black)
                      .copyWith(fontSize: FontSize.s24.sp),
                ),
                SizedBox(
                  height: AppSize.s20.h,
                ),
                Text(
                  AppConstants.loginMessage,
                  style: getLightStyle(color: ColorManager.black)
                      .copyWith(fontSize: FontSize.s22.sp),
                ),
                SizedBox(
                  height: AppSize.s50.h,
                ),
                BuildTextField(
                  prefixIcon: const Icon(Icons.email),
                  backgroundColor: ColorManager.white,
                  hint: AppConstants.hintLogin,
                  textInputType: TextInputType.emailAddress,
                  validation: AppValidators.validateEmail,
                  controller: loginScreenCubit.emailController,
                ),
                SizedBox(
                  height: AppSize.s28.h,
                ),
                BuildTextField(
                  prefixIcon: const Icon(Icons.password),
                  hint: AppConstants.hintPassword,
                  backgroundColor: ColorManager.white,
                  validation: AppValidators.validatePassword,
                  controller: loginScreenCubit.passwordController,
                  isObscured: true,
                  textInputType: TextInputType.text,
                ),
                SizedBox(
                  height: AppSize.s8.h,
                ),
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppConstants.forgetPassword,
                        style: getMediumStyle(color: ColorManager.black)
                            .copyWith(fontSize: FontSize.s18.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSize.s40.h,
                ),
                Center(
                  child: CustomElevatedButton(
                    isStadiumBorder: false,
                    label: AppConstants.loginElevatedButton,
                    backgroundColor: ColorManager.primary,
                    textStyle: getBoldStyle(
                        color: ColorManager.white, fontSize: AppSize.s18),
                    onTap: () {
                      loginScreenCubit.login();
                      Navigator.pushNamed(context, Routes.mainRoute);
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppConstants.createAccountMessage,
                      style: getSemiBoldStyle(color: ColorManager.black)
                          .copyWith(fontSize: FontSize.s18.sp),
                    ),
                    SizedBox(
                      width: AppSize.s8.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.signupRoute);
                      },
                      child: Text(
                        AppConstants.createAccount,
                        style: getSemiBoldStyle(color: ColorManager.primary)
                            .copyWith(fontSize: FontSize.s18.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
