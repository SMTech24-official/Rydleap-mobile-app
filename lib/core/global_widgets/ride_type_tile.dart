


import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class RideTypeTile extends StatelessWidget{

  final String title;
  final String subtitle;
  final String time;
  final Color backgroundColor;
  final Color textColor;

  const RideTypeTile({super.key, required this.title, required this.subtitle, required this.time, required this.backgroundColor, required this.textColor});



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