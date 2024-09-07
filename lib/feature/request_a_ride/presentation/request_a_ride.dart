




// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/pickup_and_drop_input_tile.dart';

class RequestARide extends StatefulWidget{

  @override
  State<RequestARide> createState() => _RequestARideState();
}

class _RequestARideState extends State<RequestARide> with SingleTickerProviderStateMixin {



  TabController? _tabController;
  ScrollController _scrollController = ScrollController();

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
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios)),

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [



          PickupAndDropInputTile(backGroundColor: Colors.black, width: 90.w,),




          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Tab 1'),
              Tab(text: 'Tab 2'),
              Tab(text: 'Tab 3'),
            ],
          ),


          Container(
            width: screenWidth(),
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  width: MediaQuery.of(context).size.width/2,

                  child: Center(child: Text('Content for Tab 1', style: TextStyle(fontSize: 24))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Center(child: Text('Content for Tab 2', style: TextStyle(fontSize: 24))),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Center(child: Text('Content for Tab 3', style: TextStyle(fontSize: 24))),
                ),
              ],
            ),
          ),


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
    );
  }
}