import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/style_manager.dart';

class CustomCategoryWidget extends StatelessWidget {
  CategoryEntity categoryEntity;

  CustomCategoryWidget({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 100.h,
          width: 100.w,
          fit: BoxFit.cover,
          imageUrl: categoryEntity.image ?? '',
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
            color: ColorManager.darkPrimary,
          )),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
          imageBuilder: (context, imageProvider) {
            return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
        SizedBox(height: 8.h),
        Text(
          categoryEntity.name ?? '',
          style:
              getRegularStyle(color: ColorManager.primaryDark, fontSize: 14.sp),
        ),
      ],
    );
  }
}
