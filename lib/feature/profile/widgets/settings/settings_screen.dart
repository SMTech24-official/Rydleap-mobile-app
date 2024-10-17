import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_inter.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_app_bar.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/settings/dummy_data/settings_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      appBar: CustomAppBar(
        title: "Settings",
      ),
      body: Stack(
        children: [
          Container(
            height: screenHeight(),
            width: double.infinity,
            color: AppColors.textBlack,
          ),
          Image.asset(
            'assets/images/Ellipse_9.png',
            width: 150.w,
            height: 50.h,
            fit: BoxFit.fill,
          ),
          Container(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: getHeight(39.5)),
                  itemCount: settingsItems.length,
                  itemBuilder: (context, index) {
                    final data = settingsItems[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: getHeight(14.5)),
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
                        margin: EdgeInsets.symmetric(horizontal: getWidth(15)),
                        height: getHeight(51),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xff6D6A6A))),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: getHeight(22),
                                  width: getWidth(22),
                                  child: Image.asset(data.icon),
                                ),
                                SizedBox(
                                  width: getWidth(24.5),
                                ),
                                CustomTextNunito(
                                    text: data.title,
                                    fontSize: getWidth(16),
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.white.withOpacity(0.2),
                                  onTap: data.onTap,
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
                            // IconButton(onPressed: data.onTap, icon: Icon(Icons.arrow_forward_ios,size: 16,))
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
