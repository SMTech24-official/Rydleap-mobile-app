



// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'package:flutter_sizer/flutter_sizer.dart';import '../utility/custom_circle.dart';

class PickupAndDropInputTile extends StatelessWidget{

  final Color backGroundColor;
  final double width;

  const PickupAndDropInputTile({super.key, required this.backGroundColor, required this.width});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 17.h,
        width: width,
        decoration: BoxDecoration(
            color: backGroundColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.amberAccent, width: 1.5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircle(radious: 7, color: Colors.amber),

                Icon(Icons.more_vert),

                // for(int i=0;i<4;i++)
                //   CircleAvatar(radius: 2,backgroundColor: Colors.black,),

                CustomCircle(radious: 7, color: Colors.purpleAccent),
              ],
            ),
            Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 11.h / 2,
                    width: 70.w,
                    padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Pickup location',
                        hintStyle: TextStyle(fontSize: 14),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 1,
                          width: 70.w,
                          color: Colors.grey,
                        ),
                        Icon(Icons.swap_vert),
                      ],
                    ),
                  ),
                  Container(
                    height: 11.h / 2,
                    width: 70.w,
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Enter Dropoff',
                        hintStyle: TextStyle(fontSize: 14),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}