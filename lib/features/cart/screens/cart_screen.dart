import 'package:e_commerce_app/features/cart/cubit/cart_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widget/dialog_utils.dart';
import '../cubit/cart_states.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartScreenCubit, CartStates>(
      bloc: CartScreenCubit.get(context)..getCart(),
      listener: (context, state) {
        if (state is GetCartErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        } else if (state is DeleteItemInCartErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        } else if (state is UpdateItemCountErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: ColorManager.primaryDark),
            title: Text(
              'Cart',
              style:
                  getMediumStyle(fontSize: 20, color: ColorManager.primaryDark),
            ),
          ),
          body: state is GetCartSuccessState
              ? Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                            productEntity: state
                                .getCartResponseEntity.data!.products![index],
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s12.h),
                          itemCount: state
                              .getCartResponseEntity.data!.products!.length,
                        ),
                      ),
                      TotalPriceAndCheckoutBottom(
                        totalPrice: state
                            .getCartResponseEntity.data!.totalCartPrice!
                            .toInt(),
                        checkoutButtonOnTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: ColorManager.primary,
                )),
        );
      },
    );
  }
}
