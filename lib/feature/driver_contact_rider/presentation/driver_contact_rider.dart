




import 'package:flutter/material.dart';

import '../../../core/app_imagese.dart';

class DriverContactRider extends StatelessWidget{
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

    );
  }
  
}