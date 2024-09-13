




import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/map_widget.dart';

import '../../../core/app_imagese.dart';
import '../../heading_to_rider/presentation/heading_to_rider.dart';

class DriverContactRider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      appBar: AppBar(
        backgroundColor: Color(0xff001B26),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           IconButton(onPressed: (){
             Navigator.pop(context);
           }, icon: Icon(Icons.arrow_back_ios)),
           Text('Contact Rider'),
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


      body:  Column(
        children: [
          MapWidget(height: screenHeight()/2, width: screenWidth()),



          Container(
            margin: EdgeInsets.symmetric(horizontal: 20,vertical: 11),
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1,color: Colors.white),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF001B26),
                    const Color(0xFF00638C),
                  ],),
            ),
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
                            Text('Burkina Faso',style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),),
                            Text('3 km / 12 mins',style: GoogleFonts.nunito(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),),
                          ],
                        )


                      ],
                    ),



                    Text('(4.8 ⭐)',style: GoogleFonts.nunito(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.amberAccent),),


                  ],
                ),


                SizedBox(height: 34,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Container(
                      alignment: Alignment.center,
                      width: getWidth(96),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call,color: Colors.green,size: 15,),
                          SizedBox(width: getWidth(8),),
                          Text('Call',style: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),)
                        ],
                      ),
                    ),



                    InkWell(
                      onTap: (){


                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HeadingToRider()));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: getWidth(96),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image.asset('assets/icons/nav_icon.png',height: 20,width: 20,),
                            Text('Navi',style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),)
                          ],
                        ),
                      ),
                    ),




                    Container(
                      alignment: Alignment.center,
                      width: getWidth(105),
                      padding: EdgeInsets.symmetric(horizontal: 4,vertical: 10),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.close,color: Colors.green,size: 15,),
                          Text('Cancel',style: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),)
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
                    value: true,//light.value,
                    thumbColor:
                    const MaterialStatePropertyAll<Color>(Colors.black),
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