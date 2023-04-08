import 'package:daraz_clone_app/app/utils/assets_manager.dart';
import 'package:daraz_clone_app/app/utils/color_manager.dart';
import 'package:daraz_clone_app/app/utils/font_manager.dart';
import 'package:daraz_clone_app/app/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.0.h),
        child: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 25.r,
                  height: 25.r,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.person_outline_outlined,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Hello, Welcome to Daraz!',
                  style: TextStyle(fontSize: FontSize.s12),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ImageAssets.landscape,
                        ),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                bottom: 30.h,
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.primaryWhite,
                        borderRadius: BorderRadius.circular(5)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: Text(
                      'Login /Sign up',
                      style: TextStyle(
                          color: ColorManager.primaryOrange,
                          fontSize: FontSize.s18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                IconAssets.settings,
                width: 20.w,
                // color: Colors.grey.shade700,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            const Image(image: AssetImage(ImageAssets.discount)),
            SizedBox(
              height: 8.h,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Orders",
                          style: TextStyle(fontSize: FontSize.s16),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All >',
                              style: getTextButtonStyle(
                                  color: ColorManager.primaryOrange,
                                  fontSize: FontSize.s16),
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _myOrders(Icons.payment, "To Pay"),
                        _myOrders(Icons.local_shipping_outlined, "To Ship"),
                        _myOrders(Icons.receipt_outlined, "To Receive"),
                        _myOrders(Icons.rate_review_outlined, "To Review"),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.backpack_outlined,
                              color: Colors.black54,
                              size: 30,
                            ),
                            Text(
                              "My Returns",
                              style: TextStyle(
                                fontSize: FontSize.s16,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.document_scanner_outlined,
                              color: Colors.black54,
                              size: 30,
                            ),
                            Text(
                              "My Cancellations",
                              style: TextStyle(
                                fontSize: FontSize.s16,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Gems',
                      style: TextStyle(fontSize: FontSize.s16),
                    ),
                    Container(
                      width: 150.w,
                      height: 60.h,
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Container(
                            width: 150.w,
                            height: 40.h,
                            padding: const EdgeInsets.fromLTRB(60, 10, 12, 10),
                            decoration: BoxDecoration(
                                color: ColorManager.primaryOrange,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              '--Gems',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: ColorManager.primaryWhite,
                                  fontSize: FontSize.s16),
                            ),
                          ),
                          const Positioned(
                            left: -5,
                            child: Image(
                              image: AssetImage(IconAssets.gem),
                              width: 60,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Earn/Redeem\n Gems >',
                          textAlign: TextAlign.right,
                          style: getTextButtonStyle(
                              color: ColorManager.primaryOrange,
                              fontSize: FontSize.s16),
                        ))
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Services",
                      style: TextStyle(fontSize: FontSize.s16),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        _myOrders(Icons.mail, "My Messages"),
                        _myOrders(Icons.payments_outlined, "Payment Options"),
                        _myOrders(Icons.help_outline_outlined, "Help Center"),
                        _myOrders(Icons.headset_mic_outlined, "Chat with Us"),
                        _myOrders(Icons.reviews_outlined, "My Reviews"),
                      ],
                    ),
                    // SizedBox(
                    //   height: 10.h,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _myOrders(icon, label) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.black54,
          size: 30,
        ),
        SizedBox(
          height: 6.h,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.black54,
            fontSize: FontSize.s16,
          ),
        )
      ],
    );
  }
}
