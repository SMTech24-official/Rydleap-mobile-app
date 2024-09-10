import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomSwitchButton extends StatelessWidget {
  final String text;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color color;
  const CustomSwitchButton({
    super.key,
    required this.color,
    required this.text,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: getHeight(44),
      width: double.infinity,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.nunito(
                fontSize: getWidth(16), fontWeight: FontWeight.w400),
          ),
          Transform.scale(
            scale: 0.7,
            child: Switch(
              inactiveTrackColor: Colors.transparent,
              inactiveThumbColor: Color(0xffA39696),
              activeTrackColor: Colors.white,
              value: value,
              onChanged: onChanged,
              activeColor: Color(0xff3AD896),
            ),
          ),
        ],
      ),
    );
  }
}
