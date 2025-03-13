import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../domain/entities/GetCartResponseEntity.dart';
import '../cubit/cart_screen_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final GetCartProductsEntity productEntity;

  const CartItemWidget({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 398.w,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
      ),
      child: Row(children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: ColorManager.primary.withOpacity(0.3)),
          ),
          child: Image.network(
            productEntity.product?.imageCover ?? '',
            fit: BoxFit.cover,
            height: 140.h,
            width: 120.w,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p8.w,
              vertical: AppPadding.p8.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        productEntity.product?.title ?? "",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                          color: ColorManager.primaryDark,
                          fontSize: AppSize.s18.sp,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        CartScreenCubit.get(context)
                            .deleteItemInCart(productEntity.product?.id ?? '');
                      },
                      child: Image.asset(
                        IconsAssets.icDelete,
                        color: ColorManager.primaryDark,
                        height: 22.h,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'EGP ${productEntity.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: getBoldStyle(
                            color: ColorManager.primaryDark,
                            fontSize: AppSize.s18.sp),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 7.h),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                int count = productEntity.count!.toInt();
                                count--;
                                CartScreenCubit.get(context)
                                    .updateItemCountInCart(
                                        productEntity.product?.id ?? "", count);
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                size: 20.w,
                                color: ColorManager.white,
                              )),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            '${productEntity.count}',
                            style: getMediumStyle(color: ColorManager.white)
                                .copyWith(fontSize: 18.sp),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          InkWell(
                              onTap: () {
                                int count = productEntity.count!.toInt();
                                count++;
                                CartScreenCubit.get(context)
                                    .updateItemCountInCart(
                                        productEntity.product?.id ?? "", count);
                              },
                              child: Icon(
                                Icons.add_circle_outline,
                                color: ColorManager.white,
                                size: 20.w,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
