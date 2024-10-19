import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/home/home_controller.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/custom_search.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/history_container.dart';

// class RideHistoryScreen extends StatefulWidget {
//   const RideHistoryScreen({super.key});
//
//   @override
//   _RideHistoryScreenState createState() => _RideHistoryScreenState();
// }

class RideHistoryScreen extends StatelessWidget {
  HomeController homeController = Get.find();

  // bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textBlack,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          CustomGlobalVariable.userType == 'Driver'
              ? "Drive history"
              : "Ride history",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
          ),
        ),
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
                  child: Text(
                    CustomGlobalVariable.userType == 'Driver'
                        ? "Your previous Drives with Redleap Rideers"
                        : "Your previous Rides with Redleap Drivers",
                    style: GoogleFonts.nunito(
                        fontSize: getWidth(14), fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(
                  height: getHeight(12),
                ),
                Expanded(
                  child: Obx(
                    () => homeController.userDetail.value.data?.ridesAsCustomer?.length!=0?


                        ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: homeController.userDetail.value.data?.ridesAsCustomer?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: CustomHistoryContainer(
                            ridingDate:'${homeController.ridingHistoryModel.value.data?[index].createdAt}',
                                //'${dateTimePersing('${homeController.ridingHistoryModel.value.data?[index].createdAt}')}',
                            pickupDest: '${homeController.ridingHistoryModel.value.data?[index].pickupLocation}',
                            dropOff: '${homeController.ridingHistoryModel.value.data?[index].dropoffLocation}',
                          ),
                        );
                      },
                    ):

                    Center(child: Text("No Riding History Found"),),


                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  String dateTimePersing(String date){



    DateTime parseDate =
    new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
    var outputDate = outputFormat.format(inputDate);

    return outputDate;



  }



}
