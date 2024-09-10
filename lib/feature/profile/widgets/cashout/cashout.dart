import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/cashout/components/custom_text_amount.dart';

class CashoutScreen extends StatefulWidget {
  const CashoutScreen({super.key});

  @override
  State<CashoutScreen> createState() => _CashoutScreenState();
}

class _CashoutScreenState extends State<CashoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          leading: CustomCloseButton(),
        ),
        body: Stack(
          children: [
            Container(
              color: AppColors.textBlack,
            ),
            Image.asset(
              'assets/images/Ellipse_9.png',
              width: 150.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                //balance container section
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  height: screenHeight() * 0.25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: AppColors.appbarColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: getHeight(30),
                      ),
                      Text("We owe you",
                          style: GoogleFonts.nunito(
                              fontSize: getWidth(16),
                              fontWeight: FontWeight.w400)),
                      Text("\$ 2000.34",
                          style: GoogleFonts.inter(
                              fontSize: getWidth(34),
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: getHeight(65),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getWidth(10),
                        ),
                        height: getHeight(54),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(AppImagese.card),
                                SizedBox(
                                  width: getWidth(20),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("***** 1234",
                                        style: GoogleFonts.nunito(
                                            fontSize: getWidth(15),
                                            fontWeight: FontWeight.w400)),
                                    Text("Bank of America",
                                        style: GoogleFonts.nunito(
                                            color: Color(0xffE8E2E2),
                                            fontSize: getWidth(10),
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                SizedBox(
                  height: getHeight(27),
                ),
                CustomTextAmount(
                  text: "Earnings",
                  amount: "\$2000.34",
                ),
                SizedBox(
                  height: getHeight(27),
                ),
                CustomTextAmount(
                  text: "Withdrawal fee",
                  amount: "-\$0,.50",
                  color: Color(0xffFF0000),
                ),
                SizedBox(
                  height: getHeight(27),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: Divider(
                    thickness: 0.5,
                    color: Color(
                      0xffB9B9B9,
                    ),
                  ),
                ),
                SizedBox(
                  height: getHeight(40),
                ),
                CustomTextAmount(
                  text: "Total",
                  amount: "\$1999.34",
                  fontSize: getWidth(18),
                  fontWeight: FontWeight.w600,
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: CustomGradientButton(text: "Cash Out", onTap: () {
                    _customBottomSheet(context);
                  }),
                ),
                SizedBox(
                  height: getHeight(20),
                )
              ],
            ),
          ],
        ));
  }
  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, 
      backgroundColor: Colors.transparent, 
      barrierColor: Color(
          0xff001B26).withOpacity(0.8), 
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center, 
          child: Stack(
            children: [
              Container(
                height: screenHeight(),
                width: double.infinity,
                color: Colors.transparent,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
                  height: getHeight(281),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: getHeight(120),
                        width: getWidth(95),
                        child: Image.asset(AppImagese.successIcon),
                      ),
                      SizedBox(height: getHeight(12),),
                      Text(
                        ' \$1999.34 cashed out Successfully!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: getHeight(5),),
                      Text(
                        ' Your money should be available after2 - 3 hours!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(10),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: getHeight(36),),
                      InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                              height: getHeight(40),
                              width: getWidth(104),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(88),
                                  color: Color(0xff3AD896)),
                              child: Center(
                                child: Text(
                                  "Done",
                                  style: GoogleFonts.inter(
                                      fontSize: getWidth(14),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top:
                    getHeight(40), // Adjust the top margin for the close button
                right: getWidth(
                    20), // Adjust the right margin for the close button
                child: SizedBox(
                  height: getHeight(26),
                  width: getWidth(26),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
