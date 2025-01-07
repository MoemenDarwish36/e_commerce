import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeCategoriesLoadingState extends HomeTabStates {}

class HomeCategoriesErrorState extends HomeTabStates {
  Failures categoryFailures;

  HomeCategoriesErrorState({required this.categoryFailures});
}

class HomeCategoriesSuccessState extends HomeTabStates {
  CategoryResponseEntity categoryResponseEntity;

  HomeCategoriesSuccessState({required this.categoryResponseEntity});
}

class HomeBrandsLoadingState extends HomeTabStates {}

class HomeBrandsErrorState extends HomeTabStates {
  Failures brandFailures;

  HomeBrandsErrorState({required this.brandFailures});
}

class HomeBrandsSuccessState extends HomeTabStates {
  BrandResponseEntity brandResponseEntity;

  HomeBrandsSuccessState({required this.brandResponseEntity});
}
