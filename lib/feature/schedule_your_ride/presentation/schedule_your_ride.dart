




import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/feature/home/home_controller.dart';
// import 'package:rydleap/feature/contact/presentation/contact.dart';

import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';
import '../../../core/global_widgets/pickup_and_drop_input_tile.dart';
import '../../../core/global_widgets/ride_type_tile.dart';

class ScheduleYourRide extends StatefulWidget {
  @override
  State<ScheduleYourRide> createState() => _ScheduleYourRideState();

  HomeController homeController=Get.find();

}

class _ScheduleYourRideState extends State<ScheduleYourRide>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController _scrollController = ScrollController();











  // late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  // RestorableRouteFuture<DateTime?>(
  //   onComplete: _selectDate,
  //   onPresent: (NavigatorState navigator, Object? arguments) {
  //     return navigator.restorablePush(
  //       _datePickerRoute,
  //       arguments: _selectedDate.value.millisecondsSinceEpoch,
  //     );
  //   },
  // );


  // RxInt i=0.obs;

  TimeOfDay selectedTimeRTL=TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    // Handle tab switching
    _tabController!.addListener(() {
      if (_tabController!.indexIsChanging) {
        // Scroll the listview horizontally based on the selected tab
        _scrollController.animateTo(
          _tabController!.index * MediaQuery.of(context).size.width,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001B26),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text('Schedule Your Ride'),
            // CircleAvatar(
            //   radius: 17,
            //   backgroundColor: Colors.white,
            //   child: CircleAvatar(
            //     radius: 14,
            //     child: Icon(
            //       Icons.question_mark,
            //       size: 25,
            //       color: Colors.white,
            //     ),
            //     backgroundColor: Colors.blue,
            //   ),
            // )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [



            InkWell(
              onTap: (){
                 selectedTimeRTL=showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                ) as TimeOfDay;
              },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                    width: screenWidth(),
                    height: 50,
                    child: Text('${selectedTimeRTL.hour} :${selectedTimeRTL.minute<10?'0':''}${selectedTimeRTL.minute} ${selectedTimeRTL.period.name}',style: GoogleFonts.nunito(

                        fontSize: 15,
                        fontWeight: FontWeight.w400

                    ),
                    ),
                ),
            ),




            InkWell(
              onTap: (){




                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    //which date will display when user open the picker
                    firstDate: DateTime(1950),
                    //what will be the previous supported year in picker
                    lastDate: DateTime.now());




              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  width: screenWidth(),
                  height: 50,
                  child: Text('20/02/2024',style: GoogleFonts.nunito(

                      fontSize: 15,
                      fontWeight: FontWeight.w400

                  ),)),
            ),




            PickupAndDropInputTile(
              backGroundColor: Colors.black,
              width: 90.w, hintTextPickup: 'Pickup location', hintTextDestination: 'Enter Dropoff', readOnly: false,
            ),

            TabBar(
              indicatorColor: Colors.amberAccent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              controller: _tabController,
              tabs: [
                for(int i=0;i<widget.homeController.packageModel.value.data!.length;i++)
                  Tab(text: '${widget.homeController.packageModel.value.data?[i].name}'),
                // Tab(text: 'Economy'),
                // Tab(text: 'Premium'),
                // Tab(text: 'Shared'),
              ],
            ),

            Container(
              width: screenWidth(),
              height: 129,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: widget.homeController.packageModel.value.data?.length,

                itemBuilder: (BuildContext context, int index) {

                  return  RideTypeTile(
                    title: '${widget.homeController.packageModel.value.data?[index].name}',
                    subtitle: '\$ ${widget.homeController.packageModel.value.data?[index].price}',
                    time: '${widget.homeController.packageModel.value.data?[index].minutes} mins away',
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                  );
                },





              ),
            ),

            CustomGradientButton(
              text: 'Schedule Ride',
              onTap: () {



                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      //title: Text("My title"),
                      content: Container(

                        width: getWidth(298),
                        height: getHeight(257),
                        child: Column(
                          children: [
                            Image.asset(AppImagese.successIcon),
                            SizedBox(height: 14,),
                            Text('Your Ride is scheduled!',style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),),



                            SizedBox(height: 28,),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: getWidth(104),
                                height: getHeight(40),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Text('Done',style: GoogleFonts.nunito(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),),
                              ),
                            ),






                          ],
                        ),
                      ),
                      // actions: [
                      //
                      //
                      //
                      //
                      //
                      // ],
                    );
                  },
                );

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (_) => Contact()));

              },
              width: getWidth(335),
              icon: Icons.calendar_today_outlined,
            ),

            SizedBox(height: 12,),

            CustomGradientButton(
              text: 'Back',
              onTap: () {},
              width: getWidth(335),
              colorList: [Color(0xff9B9B9B),Color(0xff9B9B9B),],
            ),




          ],
        ),
      ),
    );
  }
}
