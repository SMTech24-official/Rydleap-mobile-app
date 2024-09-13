import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/feature/driver_ride_request/presentation/driver_ride_request.dart';
import 'package:rydleap/feature/profile/screen/profile_screen.dart';

import '../../../core/global_widgets/pickup_and_drop_input_tile.dart';
import '../../../core/utility/app_colors.dart';

class DriverDashboard extends StatelessWidget {
  RxBool light = true.obs;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.navy_blue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/main_logo.png',
              width: 48,
              height: 45,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.amber),
                  borderRadius: BorderRadius.circular(20)),
              child: Text('\$ 5000.34'),
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade300.withOpacity(.3),
              radius: 23,
              child: CircleAvatar(
                radius: 20.5,
                backgroundColor: Colors.grey.shade300.withOpacity(.7),
                child: CircleAvatar(
                  radius: 20.5,
                  child: Image.asset(AppImagese.profileImage,height: 50,width: 50,),
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 31,),


            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white.withOpacity(0.2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Earnings',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    '15 may - 20 may',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              // padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.white.withOpacity(0.2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily:',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    '\$1000',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              // padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.white.withOpacity(0.2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly:',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    '\$5000',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {
                final snackbar = AnimatedSnackBar(
                  builder: ((context) {
                    return Container(
                      width: screenWidth(),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF001B26),
                            const Color(0xFF00638C),
                          ],),
                      ),
                      height: 110,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Incoming Ride Request",
                              ),
                              Container(
                                  width: screenWidth() / 2 - 110,
                                  child: Text("Details")),
                            ],
                          ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Burkina Faso',
                                        style: GoogleFonts.inter(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                      Row(
                                        children: [
                                          for (int i = 0; i < 5; i++)
                                            Icon(Icons.star,
                                                size: 10,
                                                color: i < 4
                                                    ? Colors.amber
                                                    : Colors.grey)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.6',
                                            style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '(126 trips)',
                                            style: GoogleFonts.inter(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                children: [
                                  Icon(
                                    Icons.cancel,
                                    size: getWidth(46),
                                    color: Colors.grey.shade300,
                                  ),

                                  InkWell(
                                    onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) => DriverRideRequest()));
                                      AnimatedSnackBar.removeAll();
                                    },
                                    child: Icon(
                                      Icons.check_circle,
                                      size: getWidth(46),
                                      color: Color(0xff3AD896),
                                    ),
                                  ),


                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                );
                snackbar.show(context);
              },
              child: Container(
                alignment: Alignment.center,
                width: screenWidth() - 32,
                height: 50,
                child: Text('Active Rides'),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(.3)),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            PickupAndDropInputTile(
              backGroundColor: Colors.black,
              width: 90.w,
              hintTextPickup: 'Los Angeles',
              hintTextDestination: 'Los Angeles',
              readOnly: true,
            ),
            SizedBox(
              height: 12,
            ),
            PickupAndDropInputTile(
              backGroundColor: Colors.black,
              width: 90.w,
              hintTextPickup: 'Los Angeles',
              hintTextDestination: 'Los Angeles',
              readOnly: true,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                height: 50,
                width: screenWidth(),
                child: Text(
                  'Notifications',
                  style: GoogleFonts.nunito(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )),
            ListView.builder(
                physics: ScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.3)),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImagese.profileImage,
                          width: 43,
                          height: 43,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Congratulations!',
                              style: GoogleFonts.nunito(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'You got 5 star from Burkina Faso 1min',
                              style: GoogleFonts.nunito(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
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
                  child: Obx(() => Switch(
                        // This bool value toggles the switch.
                        value: light.value,
                        thumbColor:
                            const MaterialStatePropertyAll<Color>(Colors.black),
                        trackColor: WidgetStatePropertyAll(Colors.white),
                        activeColor: Colors.white,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                          // setState(() {
                          light.value != value;
                          // });
                        },
                      )),
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
          InkWell(
            onTap: (){

              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ProfileScreen()));

            },
            child: Icon(
              Icons.person_2_outlined,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),






    );
  }
}
