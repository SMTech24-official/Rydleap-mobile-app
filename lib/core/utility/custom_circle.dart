





import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget{

  final double radious;
  final Color color;

  const CustomCircle({super.key, required this.radious, required this.color});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: radious,
      backgroundColor: color,
      child: CircleAvatar(
        radius: radious-2,
        backgroundColor: Colors.white,
      ),
    );
  }

}