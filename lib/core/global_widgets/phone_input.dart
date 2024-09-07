import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomPhoneInput extends StatelessWidget {
  const CustomPhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getHeight(50),
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xffFFFFFF).withOpacity(0.08),
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: const Color(0xffFFFFFF).withOpacity(0.08),
            offset: const Offset(0, -2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(getWidth(46)),
        color: const Color(0xffA5A3A3).withOpacity(0.5),
        border: Border.all(color: const Color(0xffA6A7A1), width: 0.4),
      ),
      padding: EdgeInsets.symmetric(horizontal: getWidth(16)),
      child: Center(
        child: IntlPhoneField(
          showCursor: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 4),
            hintText: "Phone Number",
            hintStyle: TextStyle(
              color: Color(0xffC3BBBB),
              fontSize: getWidth(15),
              fontWeight: FontWeight.w400,
            ),
            labelStyle: const TextStyle(color: Colors.black),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
          initialCountryCode: 'UK',
          dropdownIcon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xffC3BBBB), // Dropdown icon color to match hintText
          ),
          dropdownTextStyle: TextStyle(
            color: const Color(0xffC3BBBB), // Country code text color
            fontSize: getWidth(15), // Match hintText font size
            fontWeight: FontWeight.w400,
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Rounded borders
            border: Border.all(color: Colors.transparent), // Transparent border
          ),
          disableLengthCheck: true,
          onChanged: (phone) {
            print(phone.completeNumber);
          },
        ),
      ),
    );
  }
}
