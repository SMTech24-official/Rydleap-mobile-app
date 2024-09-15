import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';

import 'package:rydleap/core/global_widgets/map_widget.dart';
import 'package:rydleap/core/utility/app_colors.dart';

class Searching extends StatelessWidget {
  const Searching({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navy_blue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text(
              'Heading to Rider',
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade300.withOpacity(.3),
              radius: 23,
              child: CircleAvatar(
                radius: 20.5,
                backgroundColor: Colors.grey.shade300.withOpacity(.7),
                child: CircleAvatar(
                  radius: 20.5,
                  child: Image.asset(
                    AppImagese.profileImage,
                    height: 50,
                    width: 50,
                  ),
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              MapWidget(height: getHeight(413), width: double.infinity),
              Column(
                children: [

                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.white)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: getHeight(80),
                          width: getWidth(80),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/dummy_customer_image.png'))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Burkina Faso',
                              style: GoogleFonts.nunito(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              '3 km / 12 mins',
                              style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    Text(
                      '(4.8 ⭐)',
                      style: GoogleFonts.nunito(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.amberAccent),
                    ),
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 96,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                          Text(
                            'Call',
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 96,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.close,
                            color: Colors.green,
                          ),
                          Text(
                            'Cancel',
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
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
            Icons.home_filled,
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
                    value: true, //light.value,
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
