import 'package:e_commerce_app/core/routes_manger/routes.dart';
import 'package:e_commerce_app/core/widget/shared_preference_utils.dart';
import 'package:e_commerce_app/features/main_layout/profile_tab/cubit/profile_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/constant_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/dialog_utils.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';
import '../cubit/profile_tab_state.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileTabScreenCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileTabLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is ProfileTabErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
              context: context,
              message: state.failures.errorMessage,
              posActionName: 'ok',
              title: "Error");
        } else if (state is ProfileTabSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: AppConstants.updateSuccess,
            posActionName: 'ok',
            title: 'success',
          );
        }
      },
      bloc: ProfileTabScreenCubit.get(context),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: SafeArea(
            child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Profile Details',
              style: getMediumStyle(color: ColorManager.primaryDark)
                  .copyWith(fontSize: 20.sp),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    SharedPreferenceUtils.removeData(key: "token");
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.signInRoute, (route) => false);
                  },
                  icon: Icon(
                    Icons.logout,
                    color: ColorManager.primary,
                  )),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppSize.s20.h),
                Text(
                  'Welcome ',
                  style: getSemiBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                ),
                SizedBox(height: AppSize.s40.h),
                BuildTextField(
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                  backgroundColor: ColorManager.white,
                  hint: AppConstants.hintRegisterName,
                  controller: ProfileTabScreenCubit.get(context).nameController,
                  labelTextStyle: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                  textInputType: TextInputType.text,
                  validation: AppValidators.validateFullName,
                  hintTextStyle: getRegularStyle(color: ColorManager.primary)
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: AppSize.s100.h),
                BuildTextField(
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                  backgroundColor: ColorManager.white,
                  hint: AppConstants.hintRegisterEmail,
                  controller:
                      ProfileTabScreenCubit.get(context).emailController,
                  labelTextStyle: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                  textInputType: TextInputType.emailAddress,
                  validation: AppValidators.validateEmail,
                  hintTextStyle: getRegularStyle(color: ColorManager.primary)
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(height: AppSize.s100.h),
                BuildTextField(
                  controller:
                      ProfileTabScreenCubit.get(context).phoneController,
                  borderBackgroundColor: ColorManager.primary.withOpacity(.5),
                  backgroundColor: ColorManager.white,
                  hint: AppConstants.hintRegisterMobil,
                  labelTextStyle: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s18),
                  textInputType: TextInputType.phone,
                  validation: AppValidators.validatePhoneNumber,
                  hintTextStyle: getRegularStyle(color: ColorManager.primary)
                      .copyWith(fontSize: 18.sp),
                ),
                SizedBox(
                  height: AppSize.s100.h,
                ),
                Center(
                  child: SizedBox(
                    height: AppSize.s60.h,
                    width: MediaQuery.of(context).size.width * .9,
                    child: CustomElevatedButton(
                      label: AppConstants.update,
                      backgroundColor: ColorManager.primary,
                      textStyle: getBoldStyle(
                          color: ColorManager.white, fontSize: AppSize.s20),
                      onTap: () {
                        ProfileTabScreenCubit.get(context).updateUser();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
