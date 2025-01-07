import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/resources/color_manager.dart';
import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/style_manager.dart';

class CustomBrandWidget extends StatelessWidget {
  BrandEntity brandEntity;

  CustomBrandWidget({super.key, required this.brandEntity});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          height: 80.h,
          width: 80.w,
          fit: BoxFit.cover,
          imageUrl: brandEntity.image ?? '',
          placeholder: (context, url) => Center(
              child: CircularProgressIndicator(
            color: ColorManager.primaryDark,
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
          brandEntity.name ?? '',
          style:
              getRegularStyle(color: ColorManager.primaryDark, fontSize: 14.sp),
        ),
      ],
    );
  }
}
