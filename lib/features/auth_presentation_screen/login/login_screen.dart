import 'package:e_commerce_app/core/resources/constant_manager.dart';
import 'package:e_commerce_app/core/widget/custom_elevated_button.dart';
import 'package:e_commerce_app/core/widget/main_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routes_manger/routes.dart';
import '../../../core/widget/validators.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: SingleChildScrollView(
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
              Text(
                AppConstants.welcomeMessage,
                style: getBoldStyle(color: ColorManager.white)
                    .copyWith(fontSize: FontSize.s24.sp),
              ),
              Text(
                AppConstants.loginMessage,
                style: getLightStyle(color: ColorManager.white)
                    .copyWith(fontSize: FontSize.s16.sp),
              ),
              SizedBox(
                height: AppSize.s50.h,
              ),
              BuildTextField(
                backgroundColor: ColorManager.white,
                hint: AppConstants.hintLogin,
                label: AppConstants.labelLogin,
                textInputType: TextInputType.emailAddress,
                validation: AppValidators.validateEmail,
              ),
              SizedBox(
                height: AppSize.s28.h,
              ),
              BuildTextField(
                hint: AppConstants.hintPassword,
                backgroundColor: ColorManager.white,
                label: AppConstants.labelPassword,
                validation: AppValidators.validatePassword,
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
                      style: getMediumStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s18.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s60.h,
              ),
              Center(
                child: CustomElevatedButton(
                  isStadiumBorder: false,
                  label: AppConstants.loginElevatedButton,
                  backgroundColor: ColorManager.white,
                  textStyle: getBoldStyle(
                      color: ColorManager.primary, fontSize: AppSize.s18),
                  onTap: () {},
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
                    style: getSemiBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: FontSize.s16.sp),
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
                      style: getSemiBoldStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s16.sp),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
