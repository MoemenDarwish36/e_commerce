import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_brands_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../domain/entities/BrandResponseEntity.dart';
import 'home_tab_state.dart';

@injectable
class HomeTabCubit extends Cubit<HomeTabStates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabCubit(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(HomeTabInitialState());
  List<CategoryEntity> categoriesList = [];
  List<BrandEntity> brandsList = [];
  final List<String> sliderImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  static HomeTabCubit get(context) => BlocProvider.of(context);

  void getAllCategories() async {
    emit(HomeCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
        (error) =>
            Left(emit(HomeCategoriesErrorState(categoryFailures: error))),
        (response) {
      // if(brandsList != null) {
      categoriesList = response.data!;
      Right(emit(HomeCategoriesSuccessState(categoryResponseEntity: response)));
      // }
    });
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either
        .fold((error) => Left(emit(HomeBrandsErrorState(brandFailures: error))),
            (response) {
      // if(categoriesList != null) {
      brandsList = response.data!;
      Right(emit(HomeBrandsSuccessState(brandResponseEntity: response)));
      // }
    });
  }
}
