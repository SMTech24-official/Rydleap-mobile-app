//  Container(
//             child: Padding(
//                 padding: EdgeInsets.only(
//                     left: getWidth(20),
//                     top: getHeight(20),
//                     right: getWidth(20)),
//                 child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: 4,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.only(bottom: getHeight(14.5)),
//                         child: Container(
//                           padding:
//                               EdgeInsets.symmetric(horizontal: getWidth(15)),
//                           height: getHeight(51),
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.1),
//                               borderRadius: BorderRadius.circular(10)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "Driver behavior",
//                                 style: GoogleFonts.nunito(
//                                     fontSize: getWidth(16),
//                                     fontWeight: FontWeight.w400),
//                               ),
//                               Image.asset(AppIcons.checkFill)
//                             ],
//                           ),
//                         ),
//                       );
//                     })),
//           )
       