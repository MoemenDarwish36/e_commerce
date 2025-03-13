import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../core/routes_manger/routes.dart';
import '../../../../core/widget/custom_elevated_button.dart';
import '../../../../core/widget/dialog_utils.dart';
import '../../../../domain/entities/ProductResponseEntity.dart';
import '../../../main_layout/products_screen/cubit/product_screen_cubit.dart';
import '../../../main_layout/products_screen/cubit/product_screen_state.dart';
import '../widgets/product_description.dart';
import '../widgets/product_label.dart';
import '../widgets/product_rating.dart';

class ProductDetails extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductDetails({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductScreenCubit, ProductScreenStates>(
        listener: (context, state) {
      if (state is AddToCartErrorState) {
        DialogUtils.showMessage(
            context: context, message: state.failures.errorMessage);
      }
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
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
            title: Text(
              'product Details',
              style: getMediumStyle(color: ColorManager.primaryDark)
                  .copyWith(fontSize: 20.sp),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            surfaceTintColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: ColorManager.primary)),
                      child: ImageSlideshow(
                        initialPage: 0,
                        indicatorColor: ColorManager.primaryDark,
                        indicatorBackgroundColor: ColorManager.white,
                        indicatorBottomPadding: 20.h,
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: productEntity.images!
                            .map((url) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    url,
                                    fit: BoxFit.fill,
                                    width: 210.w,
                                    height: 210.h,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ProductLabel(
                        productName: productEntity.title ?? '',
                        productPrice: 'EGP ${productEntity.price}'),
                    SizedBox(
                      height: 16.h,
                    ),
                    ProductRating(
                        productBuyers: '${productEntity.sold} ',
                        productRating: '${productEntity.ratingsAverage}'),
                    SizedBox(
                      height: 50.h,
                    ),
                    ProductDescription(
                        productDescription: productEntity.description ?? ""),
                    SizedBox(
                      height: 170.h,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total price',
                              style: getMediumStyle(
                                      color:
                                          ColorManager.primary.withOpacity(.6))
                                  .copyWith(fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text('EGP ${productEntity.price}',
                                style: getMediumStyle(
                                        color: ColorManager.primaryDark)
                                    .copyWith(fontSize: 18.sp))
                          ],
                        ),
                        SizedBox(
                          width: 33.w,
                        ),
                        Expanded(
                          child: CustomElevatedButton(
                            label: 'Add to cart',
                            onTap: () {
                              ProductScreenCubit.get(context)
                                  .addToCart(productEntity.id ?? '');
                            },
                            prefixIcon: Icon(
                              Icons.add_shopping_cart_outlined,
                              color: ColorManager.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      );
    });
  }
}
