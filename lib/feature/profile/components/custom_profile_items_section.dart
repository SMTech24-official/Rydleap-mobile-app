import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/feature/profile/dummy_data/about_model.dart';

class CustomProfileItemsSection extends StatelessWidget {
  const CustomProfileItemsSection({
    super.key,
    required this.userData,
  });

  final Map<String, dynamic> userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        shrinkWrap: true,
        itemCount: userData['role'] == 'Driver'
            ? driverItems.length
            : userItems.length,
        itemBuilder: (context, index) {
          final data = userData['role'] == 'Driver'
              ? driverItems[index]
              : userItems[index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: getHeight(14.5)),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xff545454), width: 0.6))),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      SizedBox(
                          height: getHeight(22),
                          width: getWidth(22),
                          child: Image.asset(data.icon)),
                      SizedBox(
                        width: getWidth(24.5),
                      ),
                      CustomTextNunito(
                          text: data.title.tr,
                          fontSize: getWidth(16),
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
                // IconButton(onPressed: data.onTap, icon: Icon(Icons.arrow_forward_ios,size: 16,))
                ClipOval(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.white.withOpacity(0.2),
                      onTap: data.onTap,
                      child: SizedBox(
                        height: getWidth(24),
                        width: getWidth(24),
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
        },
      ),
    );
  }
}
