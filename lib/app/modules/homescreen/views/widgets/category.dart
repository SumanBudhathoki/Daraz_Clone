import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const Category(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
            width: 50,
          ),
          // SizedBox(
          //   width: 65.w,
          //   child:
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          // ),
        ],
      ),
    );
  }
}
