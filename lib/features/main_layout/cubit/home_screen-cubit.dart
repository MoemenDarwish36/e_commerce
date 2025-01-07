import 'package:e_commerce_app/features/main_layout/categories/presentation/categories_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favourite/presentation/favourite_screen.dart';
import '../home_tab/presentation/home_tab.dart';
import '../profile_tab/presentation/profile_tab.dart';
import 'home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  //todo: hold data - handle logic
  int currentIndex = 0;
  List<Widget> tabs = [
    HomeTab(),
    CategoriesTab(),
    FavouriteScreen(),
    ProfileTab(),
  ];

  void changeSelectedIndex(int selectIndex) {
    emit(HomeScreenInitialState());
    currentIndex = selectIndex;
    emit(ChangeSelectedIndexState());
  }
}
