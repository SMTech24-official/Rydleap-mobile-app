import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/settings/components/documents/components/custom_documents_container.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      appBar: AppBar(leading: CustomCloseButton()),
      body: Stack(
        children: [
          Container(
            height: screenHeight(),
            width: double.infinity,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 50.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
                left: getWidth(20), top: getWidth(25), right: getWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextNunito(
                    text: "Documents",
                    fontSize: getWidth(30),
                    fontWeight: FontWeight.w600),

                SizedBox(
                  height: getHeight(17),
                ),
                CustomTextNunito(
                    text: "Driver Documents",
                    color: Color(0xffECECEC),
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.w500),
                //
                SizedBox(
                  height: getHeight(42),
                ),
                //documents
                CustomDocumentsContainer(
                  text: "Documents",
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                CustomDocumentsContainer(
                  text: "Profile Picture",
                ),

                SizedBox(
                  height: getHeight(34),
                ),
                CustomTextNunito(
                    text: "Honda City - 7BUP427",
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.w500),

                SizedBox(
                  height: getHeight(16),
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: getWidth(10),
                  ),
                  height: getHeight(73),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff545454), width: 0.6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: getHeight(5)),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Image.asset(AppIcons.error)),
                            ),
                            SizedBox(width: getWidth(16)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: getHeight(5),
                                  ),
                                  CustomTextNunito(
                                    text: "Vehicle Registration Sticker",
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w400,
                                  ),

                                  SizedBox(
                                      height: getHeight(
                                          4)), // Spacing between texts
                                  Expanded(
                                    child: CustomTextNunito(
                                        text:
                                            "The Details you submitted are invalid or incorrect, hence wasn’t approved. Please resubmit your details.",
                                        fontSize: getWidth(10),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white.withOpacity(0.2),
                            onTap: () {},
                            child: SizedBox(
                              height: getWidth(30),
                              width: getWidth(30),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(22),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: getWidth(10), top: getHeight(10)),
                  height: getHeight(61),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(0xff545454), width: 0.6),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppIcons.watch),
                      SizedBox(width: getWidth(16)),
                      Column(
                        children: [
                          CustomTextNunito(
                            text: "Vehicle Insurance",
                            fontSize: getWidth(16),
                            fontWeight: FontWeight.w400,
                          ),
                          CustomTextNunito(
                            text: "Submitted, under review..",
                            color: Color(0xffE1E1E1),
                            fontSize: getWidth(10),
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
