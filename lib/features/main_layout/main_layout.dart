import 'package:e_commerce_app/features/main_layout/cubit/home_screen-cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/color_manager.dart';
import 'cubit/home_screen_states.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
        bloc: HomeScreenCubit.get(context),
        builder: (context, state) {
          return Scaffold(
            extendBody: false,
            body: HomeScreenCubit.get(context)
                .tabs[HomeScreenCubit.get(context).currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: SizedBox(
                height: 90.h,
                child: BottomNavigationBar(
                  currentIndex: HomeScreenCubit.get(context).currentIndex,
                  onTap: (value) =>
                      HomeScreenCubit.get(context).changeSelectedIndex(value),
                  backgroundColor: ColorManager.primary,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: ColorManager.primary,
                  unselectedItemColor: ColorManager.white,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: [
                    CustomBottomNavBarItem(IconsAssets.icHome, "Home"),
                    CustomBottomNavBarItem(IconsAssets.icCategory, "Category"),
                    CustomBottomNavBarItem(IconsAssets.icWithList, "WishList"),
                    CustomBottomNavBarItem(IconsAssets.icProfile, "Profile"),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class CustomBottomNavBarItem extends BottomNavigationBarItem {
  String iconPath;
  String title;

  CustomBottomNavBarItem(this.iconPath, this.title)
      : super(
          label: title,
          icon: ImageIcon(
            AssetImage(iconPath),
            color: ColorManager.white,
          ),
          activeIcon: CircleAvatar(
            backgroundColor: ColorManager.white,
            child: ImageIcon(
              AssetImage(iconPath),
              color: ColorManager.primary,
            ),
          ),
        );
}
