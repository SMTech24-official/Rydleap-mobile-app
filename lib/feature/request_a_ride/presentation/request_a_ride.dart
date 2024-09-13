// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/global_widgets/pickup_and_drop_input_tile.dart';
import 'package:rydleap/feature/contact/presentation/contact.dart';

import '../../../core/global_widgets/ride_type_tile_with_image.dart';
import '../../schedule_your_ride/presentation/schedule_your_ride.dart';

class RequestARide extends StatefulWidget {
  @override
  State<RequestARide> createState() => _RequestARideState();
}

class _RequestARideState extends State<RequestARide>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

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
            SizedBox(height: 20,),
            Column(
              children: [
                PickupAndDropInputTile(
                  backGroundColor: Colors.black,
                  width: 90.w, hintTextPickup: 'Pickup location', hintTextDestination: 'Enter Dropoff', readOnly: false,
                ),

                TabBar(
                  indicatorColor: Colors.amberAccent,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.white,
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'Economy'),
                    Tab(text: 'Premium'),
                    Tab(text: 'Shared'),
                    InkWell(
                      onTap: (){

                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => ScheduleYourRide()));
                      },
                        child: Icon(Icons.calendar_today_outlined)
                    )
                  ],
                ),

                Container(
                  width: screenWidth(),
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    shrinkWrap: true,
                    children: [
                      RideTypeTileWithImage(
                        title: 'Economy',
                        subtitle: '\$10-15',
                        time: '5 mins away',
                        backgroundColor: Colors.black,
                        textColor: Colors.white, image: 'assets/icons/economy_icon.png',
                      ),
                      RideTypeTileWithImage(
                        title: 'Premium',
                        subtitle: '\$15-20',
                        time: '3 mins away',
                        backgroundColor: Colors.white,
                        textColor: Colors.black, image: 'assets/icons/premium_icon.png',
                      ),
                      RideTypeTileWithImage(
                        title: 'Shared',
                        subtitle: '\$05-10',
                        time: '10 mins away',
                        backgroundColor: Colors.green.shade500,
                        textColor: Colors.amber, image: 'assets/icons/economy_icon.png',
                      ),
                    ],
                  ),
                ),




              ],
            ),



            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: CustomGradientButton(
                text: 'Ride Request',
                onTap: () {

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Contact()));

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
