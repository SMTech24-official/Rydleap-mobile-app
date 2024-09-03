import 'package:flutter/material.dart';
import 'package:rydleap/core/app_sizes.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(24),
      width: getWidth(24),
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
          )),
    );
  }
}
