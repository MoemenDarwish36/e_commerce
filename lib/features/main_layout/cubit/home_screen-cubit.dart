import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favourite/presentation/favourite_screen.dart';
import '../home_tab/presentation/home_tab.dart';
import '../products_screen/presentation/screens/products_screen.dart';
import '../profile_tab/presentation/profile_tab.dart';
import 'home_screen_states.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());

  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const ProductsScreen(),
    const FavouriteScreen(),
    const ProfileTab(),
  ];

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  void changeSelectedIndex(int selectIndex) {
    emit(HomeScreenInitialState());
    currentIndex = selectIndex;
    emit(ChangeSelectedIndexState());
  }
}
