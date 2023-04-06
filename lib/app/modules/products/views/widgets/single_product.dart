import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/style_manager.dart';

class SingleProductView extends StatelessWidget {
  final String imageUrl;
  final String productTitle;
  final dynamic price;
  final dynamic rating;
  final dynamic ratingCount;
  const SingleProductView({
    super.key,
    required this.imageUrl,
    required this.productTitle,
    required this.price,
    required this.rating,
    this.ratingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(imageUrl),
            width: 200.w,
            height: 200.h,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Text(
                  productTitle,
                  style: getProductTitleStyle(fontSize: FontSize.s16)
                      .copyWith(overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 25,
                    ),
                    Text(
                      '$rating/5($ratingCount)',
                      style: getProductSubtitle(
                          color: ColorManager.primaryGrey,
                          fontSize: FontSize.s16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      'Rs.',
                      style: getProductPriceStyle(
                          fontSize: FontSize.s18,
                          color: ColorManager.primaryOrange),
                    ),
                    Text(
                      // '1190',
                      price.toString(),
                      style: getProductPriceStyle(
                          fontSize: FontSize.s20,
                          color: ColorManager.primaryOrange),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
