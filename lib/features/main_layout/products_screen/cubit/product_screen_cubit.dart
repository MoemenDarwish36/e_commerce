import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerce_app/features/main_layout/products_screen/cubit/product_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductScreenCubit extends Cubit<ProductScreenStates> {
  GetAllProductsUseCase productsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductScreenCubit(
      {required this.productsUseCase, required this.addToCartUseCase})
      : super(ProductScreenInitialState());
  List<ProductEntity> productList = [];
  int numOfCartItems = 0;

  static ProductScreenCubit get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductScreenLoadingState());
    var either = await productsUseCase.invoke();
    either.fold((error) => emit(ProductScreenErrorState(failures: error)),
        (response) {
      productList = response.data!;
      emit(ProductScreenSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) => emit(AddToCartErrorState(failures: error)),
        (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      emit(AddToCartSuccessState(addToCartResponseEntity: response));
    });
  }
}
