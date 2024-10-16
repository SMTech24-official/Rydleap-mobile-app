import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.textSize,
    this.fontWeight,
  });

  final String text;
  final Color? textColor;
  final double? textSize;
  final Function onTap;
  final FontWeight? fontWeight;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  late Color color;
  late double size;

  @override
  void initState() {
    super.initState();
    // Initialize the color and size
    color = widget.textColor ?? Colors.white;
    size = widget.textSize ?? 14.0; // Default to 14 if no size is provided
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Text(
        widget.text,
        style: GoogleFonts.nunito(
          color: color,
          fontWeight: widget.fontWeight ?? FontWeight.w400,
          fontSize: size, // Use the initialized size
        ),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      // Change the color on tap down
      color = color.withOpacity(0.6);
    });
  }

  void _onTapUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 150)).then((value) {
      setState(() {
        // Reset the color and size back to the initial value
        color = widget.textColor ?? Colors.white;
        size = widget.textSize ?? 14.0; // Reset size to initial or 14
      });
    });
  }
}
