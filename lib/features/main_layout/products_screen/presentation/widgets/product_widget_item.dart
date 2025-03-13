import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerce_app/features/main_layout/products_screen/cubit/product_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';
import '../../../../../core/widget/heart_button.dart';

class ProductWidgetItem extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductWidgetItem({super.key, required this.productEntity});

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.primaryDark.withOpacity(0.3),
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CachedNetworkImage(
                  imageUrl: productEntity.imageCover ?? '',
                  height: 128.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.primaryDark,
                  )),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                    top: 8.h, right: 10.w, child: HeartButton(onTap: () {})),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    truncateTitle(productEntity.title ?? ''),
                    style: getMediumStyle(
                      color: ColorManager.primaryDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    truncateDescription(productEntity.description ?? ''),
                    style: getRegularStyle(
                      color: ColorManager.primaryDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "EGP ${productEntity.price ?? ''}",
                    style: getRegularStyle(
                      color: ColorManager.primaryDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Review (${productEntity.ratingsAverage ?? ''})",
                        style: getRegularStyle(
                          color: ColorManager.primaryDark,
                          fontSize: 12.sp,
                        ),
                      ),
                      const Icon(
                        Icons.star_rate_rounded,
                        color: ColorManager.starRateColor,
                      ),
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: InkWell(
                          onTap: () {
                            ProductScreenCubit.get(context)
                                .addToCart(productEntity.id ?? '');
                          },
                          child: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primary,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
