import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_app_bar.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/widgets/notifcation/widget/all.dart';
import 'package:rydleap/feature/profile/widgets/notifcation/widget/today.dart';
import 'package:rydleap/feature/profile/widgets/notifcation/widget/unread.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int tabIndex = 0;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      appBar: CustomAppBar(
        title: "Notifications",
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
            width: double.infinity,
            height: screenHeight(),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getHeight(8)),
                Center(
                  child: Container(
                    width: getWidth(48),
                    height: 5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Color(0xffAFAFAF),
                    ),
                  ),
                ),
                SizedBox(height: getHeight(46)),
                // Tab bar
                Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: notificationTab.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            tabIndex = index;
                            _pageController.animateToPage(
                              index,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: getWidth(26),
                              top: getHeight(10),
                              right: getWidth(26),
                              bottom: getHeight(10)),
                          child: Container(
                            height: getHeight(35),
                            width: getWidth(84),
                            decoration: BoxDecoration(
                              color: tabIndex == index
                                  ? Color(0xff4E9376)
                                  : Colors.white.withOpacity(0.11),
                              borderRadius: BorderRadius.circular(41),
                            ),
                            child: Center(
                              child: CustomTextNunito(
                                  text: notificationTab[index]),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: getHeight(20)),

                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: notificationTab.length,
                    onPageChanged: (index) {
                      setState(() {
                        tabIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        child: getTabColor(index),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getTabColor(int index) {
    switch (index) {
      case 0: // All
        return NotificationAllWidget();
      case 1: // Unread
        return UnreadWidget();
      case 2: // Today
        return TodayWidget();
      default:
        return SizedBox();
    }
  }

  List<String> notificationTab = [
    "All",
    "Unread",
    "Today",
  ];
}
