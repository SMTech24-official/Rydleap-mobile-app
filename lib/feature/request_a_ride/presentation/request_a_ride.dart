// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/pickup_and_drop_input_tile.dart';
import 'package:rydleap/feature/contact/controller/contact_controller.dart';
import 'package:rydleap/feature/contact/presentation/contact.dart';
import 'package:rydleap/feature/home/home_controller.dart';
import '../../../core/global_widgets/ride_type_tile_with_image.dart';
import '../../home/map_controller.dart';
import '../../schedule_your_ride/presentation/schedule_your_ride.dart';
import '../controller/request_a_ride_controller.dart';

class RequestARide extends StatefulWidget {
  @override
  State<RequestARide> createState() => _RequestARideState();
  HomeController homeController = Get.find();
  MapController mapController = Get.find();
  RequestARideController requestARideController = Get.find();
}

class _RequestARideState extends State<RequestARide>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController _scrollController = ScrollController();

  ContactController contactController = Get.find();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: widget.homeController.packageModel.value.data!.length + 1,
        vsync: this);

    // Handle tab switching
    _tabController!.addListener(() async {
      if (_tabController!.indexIsChanging) {
        // Scroll the listview horizontally based on the selected tab
        await _scrollController.animateTo(
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
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff001B26),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text('Request a ride'),
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 14,
                child: Icon(
                  Icons.question_mark,
                  size: 25,
                  color: Colors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                PickupAndDropInputTile(
                  backGroundColor: Colors.black,
                  width: 90.w,
                  hintTextPickup: 'Pickup location',
                  hintTextDestination: 'Enter Dropoff',
                  readOnly: false,
                ),
                TabBar(
                  indicatorColor: Colors.amberAccent,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.white,
                  controller: _tabController,
                  tabs: [
                    for (int i = 0;
                        i <
                            widget
                                .homeController.packageModel.value.data!.length;
                        i++)
                      Tab(
                          text:
                              '${widget.homeController.packageModel.value.data?[i].name}'),
                    // Tab(text: 'Premium'),
                    // Tab(text: 'Shared'),

                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ScheduleYourRide()));
                        },
                        child: Icon(Icons.calendar_today_outlined))
                  ],
                ),
                Container(
                  width: screenWidth(),
                  height: 260,
                  child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      shrinkWrap: true,
                      itemCount:
                          widget.homeController.packageModel.value.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RideTypeTileWithImage(
                          title:
                              '${widget.homeController.packageModel.value.data?[index].name}',
                          subtitle:
                              '\$ ${widget.homeController.packageModel.value.data?[index].price}',
                          time:
                              '${widget.homeController.packageModel.value.data?[index].minutes} mins away',
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          image: 'assets/icons/economy_icon.png',
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: CustomGradientButton(
                text: 'Ride Request',
                onTap: () {
                  widget.requestARideController.requestRide(
                      // mapController.currentpos.value.longitude,
                      // mapController.currentpos.value.longitude,
                      23.736598,
                      90.400872,
                      23.767961,
                      90.423319,
                      '6707637a5ef71f737aa763e7');

                  // contactController.getDriver('67075b4606381f338df574ac');
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => Contact()));
                },
                width: getWidth(335),
                icon: Icons.directions_car,
              ),
            ),
            // SizedBox(height: 12,),

            // CustomGradientButton(
            //   text: 'Back',
            //   onTap: () {},
            //   width: getWidth(335),
            //   colorList: [Color(0xff9B9B9B),Color(0xff9B9B9B),],
            // ),

            // Container(
            //   height: 50.h,
            //   width: 100.w,
            //   child: DefaultTabController(
            //     length: 3,
            //     child: Scaffold(
            //       appBar: AppBar(
            //         automaticallyImplyLeading: false,
            //         title: const TabBar(
            //           tabs: [
            //
            //
            //             Text('Economy'),
            //             Text('Premium'),
            //             Text('Shared'),
            //
            //             // Tab(icon: Icon(Icons.directions_car)),
            //             // Tab(icon: Icon(Icons.directions_transit)),
            //             // Tab(icon: Icon(Icons.directions_bike)),
            //             // Tab(icon: Icon(Icons.directions_bike)),
            //           ],
            //         ),
            //         // title: const Text('Tabs Demo'),
            //       ),
            //       body: TabBarView(
            //         children: [
            //               Container(
            //                 // margin: EdgeInsets.symmetric(horizontal: 10),
            //                 height: 157,
            //                   width: screenWidth()/2,
            //
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(10),
            //                     color: Colors.blue
            //                   ),
            //                   child: Text("data")
            //
            //
            //
            //               ),
            //               Container(
            //                   // margin: EdgeInsets.symmetric(horizontal: 10),
            //                   height: 157,
            //                   width: screenWidth()/2,
            //
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       color: Colors.blue
            //                   ),
            //                   child: Text("data")),
            //               Container(
            //                   // margin: EdgeInsets.symmetric(horizontal: 10),
            //                   height: 157,
            //                   width: screenWidth()/2,
            //
            //                   decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(10),
            //                       color: Colors.blue
            //                   ),
            //                   child: Text("data")),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
