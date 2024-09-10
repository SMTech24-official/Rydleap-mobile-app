





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DriverDashboard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(



      appBar: AppBar(
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
             border: Border.all(width: 2,color: Colors.amber),
             borderRadius: BorderRadius.circular(20)
           ),
           child: Text('\$ 5000.34'),
         ),





            CircleAvatar(
              backgroundColor: Colors.grey.shade300.withOpacity(.3),
              radius: 23,
              child: CircleAvatar(
                radius: 20.5,
                backgroundColor: Colors.grey.shade300.withOpacity(.7),
                child: CircleAvatar(
                  radius: 17,
                  child: Icon(
                    Icons.notifications_none,
                    size: 25,
                    color: Colors.black,
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


          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(5),
             color: Colors.white.withOpacity(0.2)
           ),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Text('Earnings',style: GoogleFonts.nunito(
                 fontWeight: FontWeight.w600,
                 fontSize: 25,
               ),),
               Text('15 may - 20 may',style: GoogleFonts.nunito(
                 fontWeight: FontWeight.w400,
                 fontSize: 12,
               ),)
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
               Text('Daily:',style: GoogleFonts.nunito(
                 fontWeight: FontWeight.w400,
                 fontSize: 22,
               ),),
               Text('\$1000',style: GoogleFonts.nunito(
                 fontWeight: FontWeight.w400,
                 fontSize: 22,
               ),)
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
                Text('Weekly:',style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),),
                Text('\$5000',style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                ),)
              ],
            ),
          ),



        ],
      ),
    );
  }

}