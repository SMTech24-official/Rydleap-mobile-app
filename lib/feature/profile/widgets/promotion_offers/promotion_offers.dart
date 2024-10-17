import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_inter.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_app_bar.dart';
import 'package:rydleap/core/global_widgets/custom_back_button.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/feature/profile/widgets/promotion_offers/components/custom_promo.dart';

class PromotionOffersScreen extends StatelessWidget {
  // HomeController homeController = Get.find();

  PromotionOffersScreen({super.key});

  final TextEditingController _promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: "promotion_and_offers".tr,
        icon: CustomBackButton(),
      ),
      body: Custombackground(
        widget: SizedBox(),
        bottomContainerHeight: screenHeight() * 0.85,
        child: Padding(
          padding: EdgeInsets.only(top: getHeight(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: getWidth(48),
                  height: 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffAFAFAF)),
                ),
              ),
              SizedBox(
                height: getHeight(27),
              ),
              Center(
                child: CustomTextInter(
                    text: "active_promotions".tr,
                    fontSize: getWidth(20),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: getHeight(31),
              ),
              CustomTextInter(
                  text: "promo_title_1".tr,
                  fontSize: getWidth(17),
                  fontWeight: FontWeight.w500),

              SizedBox(height: getHeight(12)),
              // Obx(() => ListView.builder(

              //       shrinkWrap: true,
              //       itemCount: homeController.promotionModel.value.data?.length,
              //       itemBuilder: (context, index) {
              //         return ListTile(
              //           title: Text(
              //             '${homeController.promotionModel.value.data?[index].title}',
              //           ),
              //           subtitle: Text(
              //             '${homeController.promotionModel.value.data?[index].subTitle}',
              //           ),
              //         );
              //       }),
              // ),
              CustomTextInter(
                  text: "save_20%_on_your_next_ride".tr,
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w400,
                  color: Color(0xffDCDCDC)),

              CustomTextInter(
                  text: "${"expiration".tr}: 12/12/2024 ",
                  fontSize: getWidth(12),
                  fontWeight: FontWeight.w400,
                  color: Color(0xffDCDCDC)),

              SizedBox(
                height: getHeight(30),
              ),
              CustomTextInter(
                  text: "promo_title_2".tr,
                  fontSize: getWidth(17),
                  fontWeight: FontWeight.w500),

              SizedBox(
                height: getHeight(12),
              ),
              CustomTextInter(
                  text: "\$${"5_off_your_next_3_rides".tr}",
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w400,
                  color: Color(0xffDCDCDC)),
              CustomTextInter(
                  text: "${"expiration".tr}: 12/12/2024 ",
                  fontSize: getWidth(12),
                  fontWeight: FontWeight.w400,
                  color: Color(0xffDCDCDC)),

              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextNunito(
                    text: "redeem_a_promo_code".tr,
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: getHeight(12),
                  ),
                  Container(
                    height: getHeight(45),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.2), width: 0.6)),
                    child: TextField(
                      controller: _promoController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            bottom: getHeight(10), left: getWidth(10)),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getHeight(63),
                  ),
                  InkWell(
                    onTap: () {
                      promoErrorBottomSheet(
                          context: context,
                          onCancelBottomTap: () {
                            Get.back();
                          },
                          onRetryBottomTap: () {
                            Get.back();
                          });
                    },
                    child: CustomBlurButton(
                      text: "redeem".tr,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
