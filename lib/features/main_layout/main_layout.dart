import 'package:e_commerce_app/features/main_layout/cubit/home_screen-cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/resources/assets_manager.dart';
import '../../core/resources/color_manager.dart';
import '../../core/widget/home_screen_app_bar.dart';
import 'cubit/home_screen_states.dart';

class MainLayout extends StatelessWidget {
  HomeScreenCubit homeScreenCubit = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
        bloc: homeScreenCubit,
        builder: (context, state) {
          return Scaffold(
            appBar: const HomeScreenAppBar(),
            extendBody: false,
            body: homeScreenCubit.tabs[homeScreenCubit.currentIndex],
            bottomNavigationBar: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: BottomNavigationBar(
                  currentIndex: homeScreenCubit.currentIndex,
                  onTap: (value) => homeScreenCubit.changeSelectedIndex(value),
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
            AssetImage(iconPath), // Inactive icon image
            color: ColorManager.white, // Inactive icon color
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
