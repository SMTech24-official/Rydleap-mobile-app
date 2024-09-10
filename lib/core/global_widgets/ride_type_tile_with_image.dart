




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_sizes.dart';

class RideTypeTileWithImage extends StatelessWidget{

  final String title;
  final String subtitle;
  final String image;
  final String time;
  final Color backgroundColor;
  final Color textColor;

  const RideTypeTileWithImage({super.key, required this.title, required this.subtitle, required this.time, required this.backgroundColor, required this.textColor, required this.image});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 11,vertical: 20),
      width: getWidth(157),
      height: getHeight(109),

      decoration: BoxDecoration(
          border: Border.all(width: 1,color: Color(0xff13BD5C)),
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor
      ),


      child: Column(
        children: [



          Container(
              margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              child: Image.asset(image,height: 107,width: 98,)
          ),



          Text(title,style: GoogleFonts.nunito(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: textColor

          ),),
          Text(subtitle,style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: textColor
          ),),




          Text(time,style: GoogleFonts.nunito(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: textColor
          ),),


        ],
      ),
    );
  }

}