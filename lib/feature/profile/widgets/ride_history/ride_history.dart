import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/global_widgets/custom_app_bar.dart';
import 'package:rydleap/core/global_widgets/custom_back_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/home/home_controller.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/custom_search.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/history_container.dart';

class RideHistoryScreen extends StatelessWidget {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: CustomGlobalVariable.userType == 'Driver'
            ? "Drive history"
            : "Ride history",
        icon: CustomBackButton(),
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
            width: 150.w, // Use responsive width
            height: 50.h, // Use responsive height
            fit: BoxFit.fill,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getHeight(21),
                ),
                CustomSearch(),
                SizedBox(
                  height: getHeight(13),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                  child: CustomTextNunito(
                      text: CustomGlobalVariable.userType == 'Driver'
                          ? "Your previous Drives with Redleap Rideers"
                          : "Your previous Rides with Redleap Drivers",
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount:
                          homeController.ridingHistoryModel.value.data?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CustomHistoryContainer(
                            ridingDate:
                                '${homeController.ridingHistoryModel.value.data?[index].createdAt}',
                            //'${dateTimePersing('${homeController.ridingHistoryModel.value.data?[index].createdAt}')}',
                            pickupDest:
                                '${homeController.ridingHistoryModel.value.data?[index].pickupLocation}',
                            dropOff:
                                '${homeController.ridingHistoryModel.value.data?[index].dropoffLocation}',
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String dateTimePersing(String date) {
    DateTime parseDate =
        new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;
  }
}
