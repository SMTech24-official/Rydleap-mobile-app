import 'package:flutter/material.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/feature/profile/widgets/notifcation/dummy_data/notification_model.dart';

class NotificationAllWidget extends StatelessWidget {
  const NotificationAllWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: getWidth(20)),
            child: CustomTextNunito(
                text: "New",
                fontWeight: FontWeight.w500,
                fontSize: getWidth(18)),
          ),
          SizedBox(height: getHeight(12)),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: notifcationItems.length,
            itemBuilder: (context, index) {
              final data = notifcationItems[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getHeight(10),
                  horizontal: getWidth(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(getWidth(10)),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.01),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // Profile Image
                      Container(
                        width: getWidth(50),
                        height: getHeight(50),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AppImagese.profileImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                          width:
                              getWidth(12)), // Spacing between image and text
                      // Text and Time
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Notification Text
                              CustomTextNunito(
                                text: data.text,
                                fontSize: getWidth(13),
                                fontWeight: FontWeight.w400,
                              ),

                              SizedBox(height: getHeight(5)),
                              // Time Text
                              Padding(
                                padding: EdgeInsets.only(right: getWidth(15)),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: CustomTextNunito(
                                        text: "1 min",
                                        color: Colors.grey,
                                        fontSize: getWidth(13))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
