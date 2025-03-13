import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/widget/custom_elevated_button.dart';

class TotalPriceAndCheckoutBottom extends StatelessWidget {
  const TotalPriceAndCheckoutBottom(
      {super.key, required this.totalPrice, required this.checkoutButtonOnTap});

  final int totalPrice;
  final void Function() checkoutButtonOnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: getMediumStyle(
                color: ColorManager.primaryDark.withOpacity(0.6),
                fontSize: AppSize.s18.sp,
              ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 150.w,
              child: Text(
                'EGP $totalPrice',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getMediumStyle(
                  color: ColorManager.primaryDark,
                  fontSize: AppSize.s18.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(width: 30.h),
        Expanded(
          child: CustomElevatedButton(
            label: 'Check Out',
            onTap: checkoutButtonOnTap,
            suffixIcon: Icon(
              Icons.arrow_forward,
              color: ColorManager.white,
            ),
          ),
        )
      ],
    );
  }
}
