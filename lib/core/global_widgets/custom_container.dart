import 'package:flutter/material.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.bottomContainerHeight,
    required this.child,
  });

  final double bottomContainerHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.only(
                 left: getWidth(18), right: getWidth(18)),
            height: bottomContainerHeight,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xff001B26),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                border:
                    Border(top: BorderSide(color: Color(0xffFFDD2D), width: 2)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffFFDD2D),
                    offset: Offset(0, 10),
                    blurRadius: 26,
                    spreadRadius: 13,
                  ),
                ]),
            child: child));
  }
}
