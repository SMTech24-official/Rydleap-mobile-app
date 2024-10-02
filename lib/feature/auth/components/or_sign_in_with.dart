import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_buttomsheet/bottomsheet_onebutton.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffDEFF11),
                  Color(0xffF0F9BE),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(getWidth(1)),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "or_sign_in_with".tr,
          style: TextStyle(
              color: Color(0xffF9F9F9),
              fontSize: getWidth(14),
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffF0F9BE),
                  Color(0xffDEFF11),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(getWidth(1)),
            ),
          ),
        ),
      ],
    );
  }
}
