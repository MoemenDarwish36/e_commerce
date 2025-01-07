import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/core/widget/dialog_utils.dart';
import 'package:e_commerce_app/features/main_layout/home_tab/cubit/home_tab_cubit.dart';
import 'package:e_commerce_app/features/main_layout/home_tab/cubit/home_tab_state.dart';
import 'package:e_commerce_app/features/main_layout/home_tab/presentation/widgets/announcement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/custom_brand_widget.dart';
import 'widgets/custom_category_widget.dart';
import 'widgets/custom_section_bar.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabCubit, HomeTabStates>(
      listener: (context, state) {
        if (state is HomeCategoriesErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.categoryFailures.errorMessage);
        }
        if (state is HomeBrandsErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.brandFailures.errorMessage);
        }
      },
      bloc: HomeTabCubit.get(context)
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AnnouncementWidget(),
              SizedBox(height: 12.h),
              CustomSectionBar(sectionName: 'Categories', function: () {}),
              state is HomeCategoriesLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                      color: ColorManager.primaryDark,
                    ))
                  : SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategoryWidget(
                            categoryEntity:
                                HomeTabCubit.get(context).categoriesList[index],
                          );
                        },
                        itemCount:
                            HomeTabCubit.get(context).categoriesList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
              SizedBox(height: 12.h),
              CustomSectionBar(sectionName: 'Brands', function: () {}),
              state is HomeBrandsLoadingState
                  ? Center(
                      child: CircularProgressIndicator(
                      color: ColorManager.primaryDark,
                    ))
                  : SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomBrandWidget(
                            brandEntity:
                                HomeTabCubit.get(context).brandsList[index],
                          );
                        },
                        itemCount: HomeTabCubit.get(context).brandsList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
              SizedBox(height: 12.h)
            ],
          ),
        );
      },
    );
  }
}
