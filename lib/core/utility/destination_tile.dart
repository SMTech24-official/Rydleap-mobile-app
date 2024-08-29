



import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationTile extends StatelessWidget{

  final String title;
  final String subtitle;

  const DestinationTile({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 41.w,
      height: 19.45.h,
      padding: EdgeInsets.symmetric(horizontal: 12),


      decoration: BoxDecoration(
          border: Border.all(color: Colors.amberAccent),
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Icon(Icons.bookmark,color: Colors.amber,)
          ],),
          
          Text(title,style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),),
          Text(subtitle,style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w400
          ),),
        ],
      ),
    );
  }


}