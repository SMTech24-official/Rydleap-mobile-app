import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rydleap/core/utility/assets_paths.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  // final Widget centerWidget;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetsPaths.splash_png,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
