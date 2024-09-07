import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_background.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class PromotionOffersScreen extends StatelessWidget {
   PromotionOffersScreen({super.key});
final TextEditingController _promoController = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Promotion and Offers",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,size: 20,),
        ),
      ),
      body: Custombackground(
        widget: SizedBox(),
        bottomContainerHeight: screenHeight()*0.85,
        child: Padding(
          padding:  EdgeInsets.only(top: getHeight(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: getWidth(48),
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(0xffAFAFAF)
                  ),
                ),
              ),
              SizedBox(height: getHeight(27),),
              Center(
                child: Text(
                  "Active Promotions ",
                  style: GoogleFonts.inter(
                    fontSize: getWidth(20),
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              SizedBox(height: getHeight(31),),
              Text(
                "Promo Title 1",
                style: GoogleFonts.inter(
                    fontSize: getWidth(17),
                    fontWeight: FontWeight.w500
                  ),
              ),
              SizedBox(
                height: getHeight(12),
              ),
            Text(
                "Save 20% on your next ride",
                style: GoogleFonts.inter(
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w400,
                    color: Color(0xffDCDCDC)
                  ),
              ),
              Text(
                "Expiration: 12/12/2024 ",
                style: GoogleFonts.inter(
                    fontSize: getWidth(12),
                    fontWeight: FontWeight.w400,
                    color: Color(0xffDCDCDC)
                  ),
              ),
             SizedBox(height: getHeight(30),),
              Text(
                "Promo Title 2",
                style: GoogleFonts.inter(
                    fontSize: getWidth(17),
                    fontWeight: FontWeight.w500
                  ),
              ),
              SizedBox(
                height: getHeight(12),
              ),
            Text(
                "\$5 off your next 3 rides",
                style: GoogleFonts.inter(
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w400,
                    color: Color(0xffDCDCDC)
                  ),
              ),
              Text(
                "Expiration: 12/12/2024 ",
                style: GoogleFonts.inter(
                    fontSize: getWidth(12),
                    fontWeight: FontWeight.w400,
                    color: Color(0xffDCDCDC)
                  ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                "Redeem a Promo Code",
                style: GoogleFonts.nunito(
                    fontSize: getWidth(18),
                    fontWeight: FontWeight.w400,
                   
                  ),
              ),
              SizedBox(height: getHeight(12),),
             Container(
              height: getHeight(45),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.white.withOpacity(0.2),width: 0.6)
              ),
              child: TextField(
                controller: _promoController,
                
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: getHeight(10),left: getWidth(10)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  ),
                ),
              ),
             ),
             SizedBox(height: getHeight(63),),
                  InkWell(
                    onTap: (){},
                    child: CustomBlurButton(
                        text: "Redeem",
                       ),
                  ),
                ],
              ),
              SizedBox(
                height: getHeight(20),
              )
            ],
          ),
        ),
      ),
    );
  }


}
