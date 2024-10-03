import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CallSupportScreen extends StatefulWidget {
  const CallSupportScreen({super.key});

  @override
  State<CallSupportScreen> createState() => _CallSupportScreenState();
}

class _CallSupportScreenState extends State<CallSupportScreen> {
  double _slidePosition = 0.0;
  bool _isSliding = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneController = TextEditingController();
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor,
        centerTitle: true,
        title: Text(
          "Call Support",
          style: GoogleFonts.inter(
              fontSize: getWidth(20), fontWeight: FontWeight.w600),
        ),
        leading: CustomCloseButton()
      ),
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
                top: getHeight(35), left: getWidth(20), right: getWidth(20)),
            child: Column(
              children: [
                Container(
                  height: getHeight(51),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff6D6A6A), width: 0.6),
                      borderRadius: BorderRadius.circular(getWidth(8))),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    decoration: InputDecoration(
                      hintText: "Phone number",
                      hintStyle: GoogleFonts.nunito(
                          fontSize: getWidth(15),
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                      contentPadding: EdgeInsets.only(
                          bottom: 10.5, left: 15, top: 10.5, right: 15),
                      enabledBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder:
                          OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: getHeight(60),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff3AD896),
                        Color(0xff3AD896).withOpacity(0),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(getWidth(8)),
                  ),
                  child: Stack(
                    children: [
                      // Center(
                      //   child: Text(
                      //     "Slide to call!",
                      //     style: GoogleFonts.nunito(
                      //       fontSize: getWidth(16),
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // ),
                      Positioned(
                        left: _slidePosition,
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            setState(() {
                              _slidePosition = (details.localPosition.dx).clamp(
                                  0,
                                  MediaQuery.of(context).size.width -
                                      getWidth(150));
                            });

                           // debugPrint('++++++++++Call Going++++++++++++++++++++++++++++++++++++++++');

                          },
                          onHorizontalDragEnd: (details) {
                            setState(() {
                              _isSliding = false;
                              if (_slidePosition >
                                  MediaQuery.of(context).size.width -
                                      getWidth(150)) {

                               // debugPrint('++++++++++Call end1++++++++++++++++++++++++++++++++++++++++');

                              }
                              _slidePosition =
                                  0; // Reset to initial position after slide
                            });


                            debugPrint('++++++++++Call end2++++++++++++++++++++++++++++++++++++++++');

                            phoneCall('01726222954');




                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: getHeight(38),
                                    width: getWidth(39),
                                    child: Image.asset(AppIcons.phone),
                                  ),
                                  SizedBox(
                                    width: getWidth(15),
                                  ),
                                  Text(
                                    "Slide to call!",
                                    style: GoogleFonts.nunito(
                                      fontSize: getWidth(16),
                                      fontWeight: FontWeight.w400,
                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getHeight(20),
                ),
              ],
            ),
          )
        ],
      ),
    );




  }


  Future<void> phoneCall(String phoneNumber) async {


    var url = Uri.parse("tel:${phoneNumber}");
    await launchUrl(url);

  }
}
