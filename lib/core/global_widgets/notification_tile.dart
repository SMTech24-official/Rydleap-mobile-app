



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_imagese.dart';

class NotificationTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
  }

}