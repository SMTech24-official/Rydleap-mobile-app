





import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget{

  final double radious;
  final Color color;
  final Color backgroundColor;

  const CustomCircle({super.key, required this.radious, required this.color, required this.backgroundColor});



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: radious,
      backgroundColor: color,
      child: CircleAvatar(
        radius: radious-2,
        backgroundColor: backgroundColor,
      ),
    );
  }

}