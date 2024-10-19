import 'package:flutter/material.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';

class CustomDocumentsContainer extends StatelessWidget {
  final String text;
  const CustomDocumentsContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: getWidth(10),
      ),
      height: getHeight(51),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xff545454), width: 0.6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(AppIcons.checkFill),
              SizedBox(
                width: getWidth(16),
              ),
              CustomTextNunito(
                  text: text,
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w400)
            ],
          ),
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.2),
                onTap: () {},
                child: SizedBox(
                  height: getWidth(30),
                  width: getWidth(30),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
