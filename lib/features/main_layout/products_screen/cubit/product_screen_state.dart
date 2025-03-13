import 'package:e_commerce_app/domain/entities/AddToCartResponseEntity.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/failures/failures.dart';

abstract class ProductScreenStates {}

class ProductScreenInitialState extends ProductScreenStates {}

class ProductScreenErrorState extends ProductScreenStates {
  Failures failures;

  ProductScreenErrorState({required this.failures});
}

class ProductScreenLoadingState extends ProductScreenStates {}

class ProductScreenSuccessState extends ProductScreenStates {
  ProductResponseEntity productResponseEntity;

  ProductScreenSuccessState({required this.productResponseEntity});
}

class AddToCartErrorState extends ProductScreenStates {
  Failures failures;

  AddToCartErrorState({required this.failures});
}

class AddToCartLoadingState extends ProductScreenStates {}

class AddToCartSuccessState extends ProductScreenStates {
  AddToCartResponseEntity addToCartResponseEntity;

  AddToCartSuccessState({required this.addToCartResponseEntity});
}
