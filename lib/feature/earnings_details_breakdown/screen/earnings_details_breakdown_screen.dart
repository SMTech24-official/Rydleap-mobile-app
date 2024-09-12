import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_close_button.dart';
import '../../../core/utility/app_colors.dart';

class EarningsDetailsBreakdownScreen extends StatelessWidget {
  const EarningsDetailsBreakdownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 60.h,
            fit: BoxFit.cover,
          ),
          Container(
            height: getHeight(210),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF001B26),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(getWidth(40)),
                  bottomRight: Radius.circular(getWidth(40)),
                )),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: getWidth(20),top: 30),
                  child: Row(
                    children: [
                      CustomCloseButton(),
                      SizedBox(
                        width: getWidth(100),
                      ),
                      Text(
                        'Earnings',
                        textAlign:TextAlign.center,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getHeight(20),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(149)),
                  child:Row(
                    children: [
                     Icon(Icons.calendar_today_outlined,size:21 ,color: Color(0xFF4B4B4B),),
                      SizedBox(
                        height: getHeight(7),
                      ),
                      Text(
                        '06/16/23',
                        style: GoogleFonts.inter(
                          color: AppColors.white.withOpacity(0.87),
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ), 
                ),
                SizedBox(height: getHeight(12),),
                Center(
                  child: Text(
                    '\$ 2000.34',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          Positioned(
            top: getHeight(190),
            left: getHeight(20),
            right: getWidth(20),
            child: Container(
              height: getHeight(272),
              width: getWidth(336),
              decoration: BoxDecoration(
                  // color: Color(0xFF001B26FC),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16.88))),
            ),
          ),
          Positioned(
              top: getHeight(447),
              left: getWidth(20),
              right: getWidth(20),
              child: Column(
                children: [
                  Text('sdfds'),
                  Text('sdfds'),
                  Text('sdfds'),
                  Text('sdfds'),
                  Text('sdfds'),
                ],
              ))
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        letIndexChange: (index) {
          return false;
        },
        height: 60,
        index: 1,
        backgroundColor: Colors.black,
        color: Color(0xffDEFF11),
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 25,
            color: Colors.black,
          ),
          Container(
            child: Column(
              children: [
                Transform.scale(
                  scale: .7,
                  // width: 32,
                  // height: 22,
                  child: Switch(
                    // This bool value toggles the switch.
                    value: true,
                    thumbColor:
                        const WidgetStatePropertyAll<Color>(Colors.black),
                    trackColor: WidgetStatePropertyAll(Colors.white),
                    activeColor: Colors.white,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      // setState(() {
                      //light.value != value;
                      // });
                    },
                  ),
                ),
                Text(
                  'Online',
                  style: GoogleFonts.inter(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Icon(
            Icons.person_2_outlined,
            size: 30,
            color: Colors.black,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }
}
