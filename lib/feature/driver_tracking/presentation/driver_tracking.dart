





import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/app_sizes.dart';
import '../../../core/global_widgets/custom_gradient_button.dart';
import '../../../core/global_widgets/pickup_and_drop_input_tile.dart';
import '../../../core/utility/app_colors.dart';
import '../../home/map_controller.dart';
import '../../request_a_ride/model/riding_request_model.dart';

class DriverTracking extends StatelessWidget{

  final RidingRequestModel ridingRequestModel;
  double poslat = 0.00;
  double poslong = 0.00;
  // LatLng currentpos = LatLng(31.119318, -99.245435);

  Rx<BitmapDescriptor> customIcon=BitmapDescriptor.defaultMarker.obs;

  void _setCustomMarkerIcon() async {
    customIcon.value = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(40, 40)), // Adjust size as needed
      'assets/images/car_map.png', // Path to the image in assets
    );




    // setState(() {}); // Trigger a rebuild once the icon is loaded
  }


  MapController mapController = Get.find();

   DriverTracking({super.key, required this.ridingRequestModel});
  @override
  Widget build(BuildContext context) {
    _setCustomMarkerIcon();
    // TODO: implement build
    return Scaffold(

      appBar: AppBar(
        backgroundColor: AppColors.navy_blue,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text('Driver Tracking'),
            CircleAvatar(
              radius: 17,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 14,
                child: Icon(
                  Icons.notification_important_outlined,
                  size: 16,
                  color: Colors.grey,
                ),
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 45.h,
              width: 100.w,
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              child: Obx(()=>GoogleMap(
                //initialCameraPosition: _kGoogle,
                markers: {
                  Marker(
                    icon: customIcon.value,
                    markerId: MarkerId("?Source"),
                    position: LatLng(ridingRequestModel.data?.assignedRider?.locations?.first.locationLat??0.00, ridingRequestModel.data?.assignedRider?.locations?.first.locationLng??0.00,),
                  ),

                  Marker(
                    markerId: MarkerId("Source"),
                    position: LatLng(ridingRequestModel.data?.ride?.pickupLat??0.00, ridingRequestModel.data?.ride?.pickupLng??0.00),
                  ),
                },
                mapType: MapType.normal,
                myLocationEnabled: true,
                compassEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(ridingRequestModel.data?.ride?.pickupLat??0.00, ridingRequestModel.data?.ride?.pickupLng??0.00),
                  zoom: 13,
                ),
                onMapCreated: (GoogleMapController controller) {

                  mapController.getCurrentPos(controller);
                  //_controller.complete(controller);
                },
              )),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 45.2.h,
              width: 100.w,
              child: Container(
                  height: 10.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                    color: Colors.black,
                    border: Border.all(width: 1, color: Colors.amber),
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
                        height: 8,
                      ),
                      Container(
                        height: 4,
                        width: 48,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '3 min (2km)',
                        style: GoogleFonts.inter(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Heading to your destination',
                        style: GoogleFonts.inter(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),

                      ////////////////////////////////

                      SizedBox(height: 10,),

                      PickupAndDropInputTile(
                        backGroundColor: Colors.black,
                        width: 90.w, hintTextPickup: 'Los Angeles', hintTextDestination: 'Los Angeles', readOnly: true,
                      ),

                      SizedBox(height: 21,),




                      // Container(
                      //   padding: EdgeInsets.symmetric(horizontal: 15,vertical: 18),
                      //   margin:
                      //   EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(color: Colors.grey.shade300),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           children: [
                      //
                      //             Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //
                      //               children: [
                      //                 Container(
                      //                   alignment: Alignment.center,
                      //                   width: getWidth(70),
                      //                   height: getHeight(24),
                      //                   color: Colors.white,
                      //                   child: Text(
                      //                     'Plate No',
                      //                     style: GoogleFonts.inter(
                      //                         fontSize: 12,
                      //                         fontWeight: FontWeight.w500,
                      //                         color: Colors.black),
                      //                   ),
                      //                 ),
                      //
                      //
                      //                 SizedBox(height: 10,),
                      //                 Text(
                      //                   'Toyota Corola, Gray',
                      //                   style: GoogleFonts.inter(
                      //                       fontSize: 15,
                      //                       fontWeight: FontWeight.w500,
                      //                       color: Colors.white),
                      //                 ),
                      //               ],
                      //             ),
                      //             Image.asset('assets/images/car3d.png',width: getWidth(86),height: getHeight(68),)
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(height: 10,),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //         children: [
                      //
                      //
                      //           Row(
                      //             mainAxisAlignment: MainAxisAlignment.start,
                      //             children: [
                      //               Container(
                      //                 height: getHeight(80),
                      //                 width: getWidth(80),
                      //                 decoration: BoxDecoration(
                      //                     image: DecorationImage(image: AssetImage('assets/images/dummy_customer_image.png'))
                      //                 ),
                      //               ),
                      //
                      //               Column(
                      //                 crossAxisAlignment: CrossAxisAlignment.start,
                      //                 children: [
                      //                   Text('Burkina Faso',style: GoogleFonts.inter(
                      //                       fontSize: 18,
                      //                       fontWeight: FontWeight.w500,
                      //                       color: Colors.white),),
                      //
                      //                   Row(
                      //                     children: [
                      //                       for(int i=0;i<5;i++)
                      //                         Icon(Icons.star,size: 10,color: i<4?Colors.amber:Colors.grey)
                      //                     ],
                      //                   ),
                      //
                      //
                      //                   Row(
                      //                     children: [
                      //                       Text('4.6',style: GoogleFonts.inter(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.w400,
                      //                           color: Colors.white),),
                      //                       Text('(126 trips)',style: GoogleFonts.inter(
                      //                           fontSize: 14,
                      //                           fontWeight: FontWeight.w400,
                      //                           color: Colors.white),),
                      //                     ],
                      //                   )
                      //
                      //
                      //
                      //                 ],
                      //               )
                      //
                      //
                      //             ],
                      //           ),
                      //
                      //
                      //           Container(
                      //             height: getHeight(60),
                      //             width: getWidth(60),
                      //             decoration: BoxDecoration(
                      //                 color: Color(0xff3AD896),
                      //                 borderRadius: BorderRadius.circular(10)
                      //             ),
                      //             child: Icon(Icons.call),
                      //           )
                      //
                      //
                      //
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // ),










                      CustomGradientButton(text: 'Cancel Ride', onTap: (){},icon: Icons.cancel,width: screenWidth()-32,)





                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

}