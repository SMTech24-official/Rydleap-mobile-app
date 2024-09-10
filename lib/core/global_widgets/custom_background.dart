import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:rydleap/core/global_widgets/custom_container.dart';

class Custombackground extends StatelessWidget {
  final Widget widget;
  final Widget child;
  final Widget? icon;
  final double bottomContainerHeight;

  const Custombackground(
      {super.key,
      required this.widget,
      required this.bottomContainerHeight,
      required this.child,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/Ellipse_9.png',
                width: 150.w,
                height: 60.h,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/effect_1.png',
                width: 80.w,
                height: 20.h,
              ),
            ],
          ),
        ),
        SizedBox(
          child: icon,
        ),
        widget,
        CustomContainer(
            bottomContainerHeight: bottomContainerHeight, child: child),
      ],
    );
  }
}
