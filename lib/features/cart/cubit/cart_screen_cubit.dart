import 'package:e_commerce_app/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerce_app/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:e_commerce_app/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/use_cases/get_cart_use_case.dart';
import 'cart_states.dart';

@injectable
class CartScreenCubit extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;

  UpdateCountInCartUseCase updateCountInCartUseCase;

  CartScreenCubit(
      {required this.getCartUseCase,
      required this.deleteItemInCartUseCase,
      required this.updateCountInCartUseCase})
      : super(CartInitialState());

  List<GetCartProductsEntity> productsList = [];

  static CartScreenCubit get(context) => BlocProvider.of(context);

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) => emit(GetCartErrorState(failures: error)),
        (response) {
      productsList = response.data!.products ?? [];
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async {
    emit(DeleteItemInCartLoadingState());
    var either = await deleteItemInCartUseCase.invoke(productId);
    either.fold((error) => emit(DeleteItemInCartErrorState(failures: error)),
        (response) {
      productsList = response.data!.products!;
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }

  void updateItemCountInCart(String productId, int count) async {
    emit(UpdateItemCountInCartLoadingState());
    var either = await updateCountInCartUseCase.invoke(productId, count);
    either.fold((error) => emit(UpdateItemCountErrorState(failures: error)),
        (response) {
      productsList = response.data!.products!;
      emit(GetCartSuccessState(getCartResponseEntity: response));
    });
  }
}
