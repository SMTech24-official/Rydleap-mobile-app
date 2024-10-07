import 'dart:async';

// import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/pickup_and_drop_input_tile.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/core/utility/destination_tile.dart';

import '../../../profile/screen/profile_screen.dart';
import '../../../request_a_ride/presentation/request_a_ride.dart';
import '../../map_controller.dart';

// class Home extends StatefulWidget {
//   Home({super.key});
//
//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(31.119318, -99.245435),
//     zoom: 14.4746,
//   );
//
//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(31.119318, -99.245435),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);
//
//   @override
//   State<Home> createState() => _HomeState();
// }

class Home extends StatelessWidget {
  // final Completer<GoogleMapController> _controller =
  //     Completer<GoogleMapController>();

  Rx<BitmapDescriptor> customIcon=BitmapDescriptor.defaultMarker.obs;



  void _setCustomMarkerIcon() async {
    customIcon.value = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(40, 40)), // Adjust size as needed
      'assets/images/car_map.png', // Path to the image in assets
    );
   // setState(() {}); // Trigger a rebuild once the icon is loaded
  }



  MapController mapController = Get.find();

  double poslat = 0.00;
  double poslong = 0.00;
  // LatLng currentpos = LatLng(31.119318, -99.245435);

  // Stream<Position>? positionStream;
  //
  // GoogleMapController? _mapController;
  // Position? currentPosition;


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }


  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  // Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);


  // Future<void> getCurrentPos() async {
  //   //
  //   // Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
  //   //
  //   // setState(() {
  //   //   currentpos=LatLng(position.latitude, position.longitude);
  //   // });
  //
  //
  //   // Geolocator.getPositionStream(locationSettings: locationSettings).listen(
  //   //         (Position? position) {
  //   //
  //   //           setState(() {
  //   //             currentpos=LatLng(position!.latitude, position.longitude);
  //   //           });
  //   //
  //   //
  //   //       //print(position == null ? 'Unknown' : '++++++++++++++++++++++${position.latitude.toString()}, ${position.longitude.toString()}+++++++++++++++++++++++++++++');
  //   //     });
  //
  //
  //
  //
  //
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   // Check location permissions
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied.');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // Get the position stream
  //   positionStream = Geolocator.getPositionStream(
  //     locationSettings: const LocationSettings(
  //       accuracy: LocationAccuracy.high, // High accuracy
  //       distanceFilter: 10, // Update if user moves 10 meters
  //     ),
  //   );
  //
  //   positionStream!.listen((Position position) {
  //     setState(() {
  //       // currentPosition = position;
  //       currentpos=LatLng(position.latitude, position.longitude);
  //
  //       _mapController?.animateCamera(
  //         CameraUpdate.newCameraPosition(
  //           CameraPosition(
  //             target: currentpos,
  //             zoom: 14, // You can change the zoom level here
  //           ),
  //         ),
  //       );
  //
  //
  //
  //
  //     });
  //   });
  //
  //
  // }



 // @override
//   void initState()  {
//     // TODO: implement initState
//     super.initState();
//
//
//
//     //print('+++++++++++++++${determinePosition().asStream()}++++++++++++++++++++++++++++++++++');
//
//
//     // Geolocator.getPositionStream(locationSettings: locationSettings).listen(
//     //         (Position? position) {
//     //
//     //       setState(() {
//     //         currentpos=LatLng(position!.latitude, position.longitude);
//     //       });
//     //
//     //
//     //       //print(position == null ? 'Unknown' : '++++++++++++++++++++++${position.latitude.toString()}, ${position.longitude.toString()}+++++++++++++++++++++++++++++');
//     //     });
//
//     // getCurrentPos();
//
//     //currentpos=LatLng(, -99.245435);
//
// //     Position position = await Geolocator.getCurrentPosition();
// //
// // // supply location settings to getPositionStream
// //     StreamSubscription<Position> positionStream = Geolocator.getPositionStream(locationSettings: locationSettings).listen(
// //             (Position? position) {
// //           print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
// //         });
//
//
//
//
//   }








  @override
  Widget build(BuildContext context) {

    _setCustomMarkerIcon();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001B26),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/main_logo.png',
              width: 48,
              height: 45,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hello,",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w500, fontSize: 25),
                ),
                Text(
                  "User",
                  style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w400, fontSize: 12),
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.grey.shade300.withOpacity(.3),
              radius: 23,
              child: CircleAvatar(
                radius: 20.5,
                backgroundColor: Colors.grey.shade300.withOpacity(.7),
                child: CircleAvatar(
                  radius: 17,
                  child: Icon(
                    Icons.notifications_none,
                    size: 25,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
          ),
          Positioned(
            child: Container(
              height: 50.h,
              width: 100.w,
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Obx(()=>GoogleMap(

                markers: {
                  Marker(
                    markerId: MarkerId("Source"),
                    position: mapController.currentpos.value,
                  ),

                  Marker(
                    markerId: MarkerId("Source1"),
                    position: LatLng(mapController.randLat(mapController.currentpos.value.latitude), mapController.randLong(mapController.currentpos.value.longitude)),
                    icon: customIcon.value, //?? BitmapDescriptor.defaultMarker,//BitmapDescriptor.asset(ImageConfiguration(size: Size(24, 24)), 'assets/custom_marker.png',),
                    // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  ),

                  Marker(
                    markerId: MarkerId("Source2"),
                    position: LatLng(mapController.randLat(mapController.currentpos.value.latitude), mapController.randLong(mapController.currentpos.value.longitude)),
                    icon: customIcon.value, //?? BitmapDescriptor.defaultMarker,//BitmapDescriptor.asset(ImageConfiguration(size: Size(24, 24)), 'assets/custom_marker.png',),
                    // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  ),
                  Marker(
                    markerId: MarkerId("Source3"),
                    position: LatLng(mapController.randLat(mapController.currentpos.value.latitude), mapController.randLong(mapController.currentpos.value.longitude)),
                    icon: customIcon.value, //?? BitmapDescriptor.defaultMarker,//BitmapDescriptor.asset(ImageConfiguration(size: Size(24, 24)), 'assets/custom_marker.png',),
                    // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  ),


                  Marker(
                    markerId: MarkerId("Source4"),
                    position: LatLng(mapController.randLat(mapController.currentpos.value.latitude), mapController.randLong(mapController.currentpos.value.longitude)),
                    icon: customIcon.value, //?? BitmapDescriptor.defaultMarker,//BitmapDescriptor.asset(ImageConfiguration(size: Size(24, 24)), 'assets/custom_marker.png',),
                    // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
                  ),


                },
                mapType: MapType.normal,
                myLocationEnabled: true,
                compassEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: mapController.currentpos.value,
                  zoom: 13,
                ),
                onMapCreated: (GoogleMapController controller) {


                  mapController.getCurrentPos(controller);

                  // _mapController = controller;
                  //_controller.complete(controller);
                },
              )),
            ),
          ),
          Positioned(
            top: 40.h,
            child: Container(
              height: 50.h,
              width: 100.w,
              decoration: BoxDecoration(color: AppColors.navy_blue),
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 12.81.h, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  border: Border.all(color: AppColors.lightPrimary),
                  color: AppColors.navy_blue,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.lightPrimary,
                      spreadRadius: 7,
                      blurRadius: 22,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: 100,
                        child: Divider(
                          thickness: 5,
                          color: Colors.grey,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DestinationTile(
                            title: 'Home',
                            subtitle:
                                '724 S Spring St, Los Angeles, CA 90014, USA724 S Spring St, Los Angeles, CA 90014, USA'),
                        DestinationTile(
                            title: 'Office',
                            subtitle:
                                '724 S Spring St, Los Angeles, CA 90014, USA724 S Spring St, Los Angeles, CA 90014, USA'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: 31.5.h,
              child: PickupAndDropInputTile(
                backGroundColor: Colors.white,
                width: 90.w,
                hintTextPickup: 'Pickup location',
                hintTextDestination: 'Enter Dropoff',
                readOnly: false,
              )

              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: 20),
              //   padding: EdgeInsets.symmetric(hori, hintTextDestination: ''zontal: 10),
              //   height: 17.h,
              //   width: 90.w,
              //   decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(20),
              //       border: Border.all(color: Colors.amberAccent, width: 1.5)),
              //   child: Row(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           CustomCircle(radious: 7, color: Colors.amber),
              //
              //           Icon(Icons.more_vert),
              //
              //           // for(int i=0;i<4;i++)
              //           //   CircleAvatar(radius: 2,backgroundColor: Colors.black,),
              //
              //           CustomCircle(radious: 7, color: Colors.purpleAccent),
              //         ],
              //       ),
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Container(
              //             height: 11.h / 2,
              //             width: 70.w,
              //             padding: EdgeInsets.fromLTRB(10, 10, 20, 0),
              //             child: TextFormField(
              //               style: TextStyle(color: Colors.black, fontSize: 14),
              //               decoration: InputDecoration(
              //                 hintText: 'Pickup location',
              //                 hintStyle: TextStyle(fontSize: 14),
              //                 enabledBorder: InputBorder.none,
              //                 focusedBorder: InputBorder.none,
              //               ),
              //             ),
              //           ),
              //           Container(
              //             height: 40,
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Container(
              //                   height: 1,
              //                   width: 70.w,
              //                   color: Colors.grey,
              //                 ),
              //                 Icon(Icons.swap_vert),
              //               ],
              //             ),
              //           ),
              //           Container(
              //             height: 11.h / 2,
              //             width: 70.w,
              //             padding: EdgeInsets.fromLTRB(10, 0, 20, 10),
              //             child: TextFormField(
              //               style: TextStyle(color: Colors.black, fontSize: 14),
              //               decoration: InputDecoration(
              //                 hintText: 'Enter Dropoff',
              //                 hintStyle: TextStyle(fontSize: 14),
              //                 enabledBorder: InputBorder.none,
              //                 focusedBorder: InputBorder.none,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),

              ),
          Positioned(
            top: 20,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                color: Colors.grey.shade600.withOpacity(0.6),
                //Color(0xffE6E6E6).withOpacity(opacity),
                height: 50,
                width: screenWidth() - 32,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      hintText: 'Location',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),




          Positioned(
              top: 21,
              right: 18,
              child: Container(
                height: 47,
                width: 80,
                color: Colors.white,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => RequestARide()));
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ))
        ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        letIndexChange: (index) {
          return false;
        },
        height: 60,
        index: 1,
        backgroundColor: AppColors.navy_blue,
        color: Color(0xffDEFF11),
        items: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.3),
            child: Icon(
              Icons.home_filled,
              size: 25,
              color: Colors.black,
            ),
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.black,
          ),
          InkWell(
            onTap: () {

              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfileScreen()));

            },
            child: Icon(
              Icons.person_2_outlined,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),

      // bottomNavigationBar: FluidNavBar(
      //   defaultIndex: 1,// (1)
      //   icons: [                                            // (2)
      //     FluidNavBarIcon(icon: Icons.home_filled),      // (3)
      //     FluidNavBarIcon(icon: Icons.add),      // (3)
      //     FluidNavBarIcon(icon: Icons.person),      // (3)
      //
      //   ],
      //   //onChange: _handleNavigationChange,
      //
      //
      //
      //   style: FluidNavBarStyle(
      //       barBackgroundColor: Color(0xffDEFF11),
      //       iconBackgroundColor: Color(0xffDEFF11),
      //       iconSelectedForegroundColor: Colors.black,
      //       iconUnselectedForegroundColor: Colors.grey
      //   ),
      // ),
    );
  }
}
