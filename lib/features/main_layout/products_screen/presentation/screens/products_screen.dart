import 'package:e_commerce_app/features/main_layout/products_screen/cubit/product_screen_cubit.dart';
import 'package:e_commerce_app/features/main_layout/products_screen/cubit/product_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/routes_manger/routes.dart';
import '../../../../../core/widget/dialog_utils.dart';
import '../../../../product_details/presentation/screen/product_details.dart';
import '../widgets/product_widget_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductScreenCubit, ProductScreenStates>(
      bloc: ProductScreenCubit.get(context)..getAllProducts(),
      listener: (context, state) {
        if (state is AddToCartErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        } else if (state is ProductScreenErrorState) {
          DialogUtils.showMessage(
              context: context, message: state.failures.errorMessage);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p18),
          child: SafeArea(
            child: Scaffold(
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    'product Tab',
                    style: getMediumStyle(color: ColorManager.primaryDark)
                        .copyWith(fontSize: 20.sp),
                  ),
                  actions: [
                    IconButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, Routes.cartRoute),
                        icon: Badge(
                          label: Text(ProductScreenCubit.get(context)
                              .numOfCartItems
                              .toString()),
                          child: ImageIcon(
                            AssetImage(IconsAssets.icCart),
                            color: ColorManager.primary,
                          ),
                        ))
                  ],
                  backgroundColor: Colors.transparent,
                  surfaceTintColor: Colors.white,
                ),
                body: state is ProductScreenLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                          color: ColorManager.primary,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(AppPadding.p16),
                        child: GridView.builder(
                          itemCount: ProductScreenCubit.get(context)
                              .productList
                              .length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.w,
                            mainAxisSpacing: 8.h,
                            childAspectRatio: 6 / 10,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          productEntity:
                                              ProductScreenCubit.get(context)
                                                  .productList[index])));
                                },
                                child: ProductWidgetItem(
                                    productEntity:
                                        ProductScreenCubit.get(context)
                                            .productList[index]));
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      )),
          ),
        );
      },
    );
  }
}
