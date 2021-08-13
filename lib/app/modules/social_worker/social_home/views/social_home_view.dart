import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/models/sliver_persistent_header.dart';
import 'package:six/app/modules/charity/purchase/views/purchase_view.dart';
import 'package:six/app/modules/needy_family/profile/views/profile_view.dart';
import 'package:six/app/routes/app_pages.dart';
import 'package:six/app/ui/components/bottom_nav_bar.dart';
import 'package:six/app/ui/components/catched_image.dart';
import 'package:six/app/ui/components/circular_progress_indicator.dart';
import 'package:six/app/ui/components/sizedbox.dart';
import 'package:six/r.g.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

import '../controllers/social_home_controller.dart';

class SocialHomeView extends GetView<SocialHomeController> {
  final List<Widget> bottomScreen = <Widget>[
    SocialHome(),
    PurchaseView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          bottomNavigationBar:
              controller.paid() ? const SizedBox.shrink() : bottomNavBar(),
          backgroundColor: AppColors.kffffff,
          body: bottomScreen.elementAt(controller.currentIndex!())),
    );
  }
}

class SocialHome extends StatelessWidget {
  final SocialHomeController controller = Get.put(SocialHomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: CustomScrollView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          controller: controller.scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 5,
              expandedHeight: 300.h,
              toolbarHeight: 200.h,
              backgroundColor: AppColors.kE3FCFF,
              shadowColor: AppColors.k00474E.withOpacity(0.14),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  R.image.six_logo().assetName,
                  height: 77.h,
                  width: 170.w,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed<void>(Routes.NOTIFICATION);
                  },
                  child: Container(
                    width: 160.w,
                    height: 160.h,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(
                      right: 20,
                      left: 15,
                      bottom: 5,
                      top: 8,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.kffffff,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40.sp,
                            color: AppColors.kD1EFF2.withOpacity(0.8),
                            offset: const Offset(0, 5),
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(70.r))),
                    child: Image.asset(
                      R.image.bell().assetName,
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    width: 1.sw,
                    height: 450.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: 1.sw,
                          height: 180.h,
                          color: AppColors.kE3FCFF,
                        ),
                        // Positioned(
                        //   top: 0.h,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       monthPickerDialog(
                        //         context: context,
                        //         selectedDate: controller.selectedDate,
                        //       ).then((value) =>
                        //           /*controller.*/ assignMonth(
                        //               value?.month ?? 1));
                        //     },
                        //     child: monthPicker(
                        //       color: AppColors.kffffff,
                        //       borderColor: AppColors.kE3FCFF,
                        //       height: 80.h,
                        //       shadowColor: AppColors.k0A9988,
                        //       width: 390.w,
                        //       textContent: Text(
                        //         '${controller.monthName()}, ${controller.selectedDate.year}',
                        //         style: TextStyle(
                        //           fontFamily: 'Gilroy',
                        //           fontSize: 40.sp,
                        //           fontStyle: FontStyle.normal,
                        //           color: AppColors.k1FAF9E,
                        //           fontWeight: FontWeight.w500,
                        //         ),
                        //       ),
                        //       onTapArrow: () {},
                        //     ),
                        //   ),
                        // ),
                        Positioned(
                          top: 0.h,
                          child: Container(
                            height: 350.h,
                            width: 1005.w,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment(-1, -2.8),
                                  end: Alignment(1, 10),
                                  colors: [
                                    AppColors.k1FAF9E,
                                    AppColors.k0087FF
                                  ]),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: ClipRRect(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Column(
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 75.h,
                                      ),
                                      Obx(() => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.toNamed<void>(
                                                    Routes.AVAILABLE_CREDITS_SW,
                                                  );
                                                },
                                                child: Container(
                                                  height: 220.h,
                                                  width: 452.5.w,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.kffffff
                                                        .withOpacity(0.2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.k00474E
                                                            .withOpacity(0.04),
                                                        offset:
                                                            const Offset(0, 20),
                                                        blurRadius: 50.r,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                  ),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 53.h,
                                                        ),
                                                        controller.isLoading()
                                                            ? FittedBox(
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                child:
                                                                    buildPaymentLoader(),
                                                              )
                                                            : RichText(
                                                                text: TextSpan(
                                                                  text: '\$',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Gilroy',
                                                                    fontSize:
                                                                        60.sp,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    color: AppColors
                                                                        .kffffff
                                                                        .withOpacity(
                                                                            0.5),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                  ),
                                                                  children: [
                                                                    TextSpan(
                                                                      text: controller
                                                                          .availableCredits()
                                                                          .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            'Gilroy',
                                                                        fontSize:
                                                                            60.sp,
                                                                        fontStyle:
                                                                            FontStyle.normal,
                                                                        color: AppColors
                                                                            .kffffff,
                                                                        fontWeight:
                                                                            FontWeight.w700,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Text(
                                                          'Available Credits',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Gilroy',
                                                            fontSize: 35.sp,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: AppColors
                                                                .kffffff
                                                                .withOpacity(
                                                                    0.7),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20.5.w,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  //Get.toNamed<void>(Routes.ADD_NOTE);
                                                },
                                                child: Container(
                                                  height: 220.h,
                                                  width: 452.5.w,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.kffffff
                                                        .withOpacity(0.2),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors.k00474E
                                                            .withOpacity(0.04),
                                                        offset:
                                                            const Offset(0, 20),
                                                        blurRadius: 50.r,
                                                      ),
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.r),
                                                  ),
                                                  child: Center(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 53.h,
                                                        ),
                                                        controller.isLoading()
                                                            ? FittedBox(
                                                                fit: BoxFit
                                                                    .scaleDown,
                                                                child:
                                                                    buildPaymentLoader())
                                                            : Text(
                                                                controller
                                                                    .beneficiaryCount()
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Gilroy',
                                                                  fontSize:
                                                                      60.sp,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .normal,
                                                                  color: AppColors
                                                                      .kffffff,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Text(
                                                          'Total Beneficiaries',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Gilroy',
                                                            fontSize: 35.sp,
                                                            fontStyle: FontStyle
                                                                .normal,
                                                            color: AppColors
                                                                .kffffff
                                                                .withOpacity(
                                                                    0.7),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )),
                                      SizedBox(
                                        height: 40.h,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 39.w,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverAppBarDelegate(
                minHeight: 110.h,
                maxHeight: 110.h,
                child: Container(
                  width: 1.sw,
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    color: AppColors.kffffff,
                    /*  boxShadow: [
                          BoxShadow(
                            color: AppColors.k00474E.withOpacity(0.1),
                            offset: const Offset(0, 20),
                            blurRadius: 50.r,
                          ),
                        ],
                      */
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 22, top: 0),
                    child: Text(
                      'My Beneficiaries',
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 60.sp,
                        fontStyle: FontStyle.normal,
                        color: AppColors.k033660.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Obx(() => controller.isLoading()
                      ? buildLoader()
                      : Container(
                          width: 1.sw,
                          child: ListView.separated(
                            itemCount: controller.beneficiaryList().length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            physics: const ClampingScrollPhysics(),
                            separatorBuilder: (context, index) => controller
                                        .beneficiaryList[index].userMetadata ==
                                    null
                                ? const SizedBox.shrink()
                                : h(15.h),
                            itemBuilder: (context, index) {
                              controller.beneIndex!(index);
                              if (controller
                                      .beneficiaryList[index].userMetadata !=
                                  null) {
                                if (controller.beneficiaryList[index]
                                        .userMetadata?.address ==
                                    null) {
                                  controller.isAddressNull(true);
                                }
                                controller.assignAddress(jsonDecode(controller
                                        .beneficiaryList[index]
                                        .userMetadata
                                        ?.address
                                        .toString() ??
                                    '{}') as Map<String, dynamic>);
                              }
                              return /* controller.beneficiaryList[index]
                                          .userMetadata ==
                                      null
                                  ? const SizedBox.shrink()
                                  :*/
                                  GestureDetector(
                                onTap: () {
                                  Get.toNamed<void>(
                                    Routes.BENEFICIARY_DETAILS,
                                    arguments: [
                                      controller.beneficiaryList()[index],
                                      index
                                    ],
                                  );
                                },
                                child: Container(
                                  width: 1.sw,
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 38.0),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0.0),
                                              child: Container(
                                                  height: 339.h,
                                                  width: 970.w,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.kffffff,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: AppColors
                                                                .k00474E
                                                                .withOpacity(
                                                                    0.04),
                                                            blurRadius: 50.r,
                                                            offset:
                                                                const Offset(
                                                                    0, 20))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.r)),
                                                  child: FittedBox(
                                                    child: Row(
                                                      children: [
                                                        w(81.w),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            h(30.h),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                w(50.w),
                                                                Text(
                                                                  controller
                                                                          .beneficiaryList()[
                                                                              index]
                                                                          .userMetadata
                                                                          ?.principalName ??
                                                                      controller
                                                                          .beneficiaryList()[
                                                                              index]
                                                                          .userMetadata
                                                                          ?.nricFin ??
                                                                      '-',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Gilroy',
                                                                    fontSize:
                                                                        50.sp,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .normal,
                                                                    color: AppColors
                                                                        .k033660,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                w(80.w),
                                                                controller
                                                                            .beneficiaryList()[
                                                                                index]
                                                                            .userMetadata
                                                                            ?.mobileNumber ==
                                                                        null
                                                                    ? const SizedBox
                                                                        .shrink()
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          url_launcher
                                                                              .launch('tel://${controller.beneficiaryList()[index].userMetadata?.mobileNumber.toString()}');
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              80.w,
                                                                          width:
                                                                              388.h,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(100.r),
                                                                            color:
                                                                                AppColors.k13A89E.withOpacity(0.1),
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Row(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                w(35.w),
                                                                                Image.asset(
                                                                                  R.image.asset.call.assetName,
                                                                                  height: 35.r,
                                                                                  width: 35.r,
                                                                                ),
                                                                                w(10.w),
                                                                                Text(
                                                                                  '${controller.beneficiaryList()[index].userMetadata?.mobileNumber ?? '-'}',
                                                                                  style: TextStyle(
                                                                                    fontFamily: 'Gilroy',
                                                                                    fontSize: 38.sp,
                                                                                    fontStyle: FontStyle.normal,
                                                                                    color: AppColors.k13A89E.withOpacity(0.7),
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                w(35.w),
                                                                controller
                                                                            .beneficiaryList()[
                                                                                index]
                                                                            .userMetadata
                                                                            ?.mobileNumber ==
                                                                        null
                                                                    ? const SizedBox
                                                                        .shrink()
                                                                    : GestureDetector(
                                                                        onTap:
                                                                            () {},
                                                                        child:
                                                                            const Icon(
                                                                          Icons
                                                                              .keyboard_arrow_right_sharp,
                                                                          color:
                                                                              AppColors.k4F7290,
                                                                          size:
                                                                              25,
                                                                        ),
                                                                      )
                                                              ],
                                                            ),
                                                            h(10.h),
                                                            GestureDetector(
                                                              onTap: () {
                                                                controller.launchURL(controller
                                                                        .beneficiaryList()[
                                                                            index]
                                                                        .userMetadata
                                                                        ?.email
                                                                        .toString() ??
                                                                    'mail@dharmtech.in ');
                                                              },
                                                              child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 50.w,
                                                                  ),
                                                                  Image.asset(
                                                                    R
                                                                        .image
                                                                        .asset
                                                                        .message
                                                                        .assetName,
                                                                    height:
                                                                        33.h,
                                                                    width: 37.w,
                                                                  ),
                                                                  w(15.w),
                                                                  Text(
                                                                    controller.beneficiaryList()[index].userMetadata?.email ==
                                                                            null
                                                                        ? '-'
                                                                        : controller.beneficiaryList()[index].userMetadata?.email.toString() ??
                                                                            'email',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          'Gilroy',
                                                                      fontSize:
                                                                          38.sp,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .normal,
                                                                      color: AppColors
                                                                          .k033660
                                                                          .withOpacity(
                                                                              0.7),
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                            h(25.h),
                                                            controller
                                                                    .isAddressNull()
                                                                ? const SizedBox
                                                                    .shrink()
                                                                : Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      SizedBox(
                                                                        width:
                                                                            50.w,
                                                                      ),
                                                                      Image
                                                                          .asset(
                                                                        R
                                                                            .image
                                                                            .asset
                                                                            .location
                                                                            .assetName,
                                                                        height:
                                                                            37.h,
                                                                        width:
                                                                            31.w,
                                                                      ),
                                                                      w(15.w),
                                                                      FittedBox(
                                                                        fit: BoxFit
                                                                            .scaleDown,
                                                                        child:
                                                                            Text(
                                                                          controller
                                                                              .returnAddress(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Gilroy',
                                                                            fontSize:
                                                                                38.sp,
                                                                            fontStyle:
                                                                                FontStyle.normal,
                                                                            color:
                                                                                AppColors.k033660.withOpacity(0.7),
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.left,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 25.h,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 129.h,
                                        right: 0.81.sw,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: AppColors.kffffff,
                                                width: 8.w,
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.k001F22
                                                      .withOpacity(0.03),
                                                  blurRadius: 25.r,
                                                  offset: Offset(10.sp, 25.sp),
                                                ),
                                              ]),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: controller
                                                        .beneficiaryList()[
                                                            index]
                                                        .profileImageUrl ==
                                                    null
                                                ? CircleAvatar(
                                                    radius: 80.r,
                                                    child: const Icon(
                                                      Icons.person,
                                                    ),
                                                  )
                                                : cacheImage(
                                                    height: 180.r,
                                                    width: 180.r,
                                                    url: controller
                                                        .beneficiaryList()[
                                                            index]
                                                        .profileImageUrl
                                                        .toString(),
                                                  ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
