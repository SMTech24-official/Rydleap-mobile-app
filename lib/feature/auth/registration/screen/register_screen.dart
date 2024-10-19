// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:rydleap/core/app_icons.dart';
// import 'package:rydleap/core/app_imagese.dart';
// import 'package:rydleap/core/app_sizes.dart';
// import 'package:rydleap/core/global_widgets/custom_background.dart';
// import 'package:rydleap/core/global_widgets/custom_glass_button.dart';
// import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
// import 'package:rydleap/core/global_widgets/global_variable.dart';
// import 'package:rydleap/core/global_widgets/phone_input.dart';
// import 'package:rydleap/core/utility/app_colors.dart';
// import 'package:rydleap/feature/auth/components/or_sign_in_with.dart';
// import 'package:rydleap/feature/auth/dirver_registration/driver_registration.dart';
// import 'package:rydleap/feature/auth/otp/controller/otp_controller.dart';
// import 'package:rydleap/feature/auth/login/login_screen.dart';
// import 'package:rydleap/feature/auth/otp/otp2_screen.dart';
// import 'package:rydleap/feature/auth/presentaion/screens/name_email_screen.dart';
// import 'package:rydleap/feature/auth/otp/otp_screen.dart';
// import 'package:rydleap/feature/driver_dashboard/presentation/driver_dashboard.dart';
// import 'package:rydleap/feature/home/presentation/screens/home.dart';
// import 'package:rydleap/feature/payment_options/screen/payment_options_screen.dart';
// import 'package:rydleap/feature/profile/screen/profile_screen.dart';
// import 'package:rydleap/feature/profile/widgets/contact_support/email_support.dart';
// import 'package:rydleap/feature/profile/widgets/language/language_screen.dart';
// import 'package:rydleap/feature/profile/widgets/privacy_settings/privacy_settings_screen.dart';
// import 'package:rydleap/feature/profile/widgets/promotion_offers/promotion_offers.dart';
// import 'package:rydleap/feature/social_login/google_login.dart';
// import 'package:rydleap/feature/trip_summery/trip_summery_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   final String role; // Add this line to accept the role

//   const RegisterScreen(
//       {super.key,
//       required this.role}); // Update the constructor to require the role

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   // final OtpController otpController = Get.put(OtpController());
//   final TextEditingController phoneController =
//       TextEditingController(text: "+8801843892344");
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   User? _user;

//   Future<void> _signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser != null) {
//         final GoogleSignInAuthentication googleAuth =
//             await googleUser.authentication;

//         final credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         final UserCredential userCredential =
//             await _auth.signInWithCredential(credential);

//         // Navigate to the NameEmailScreen if login is successful
//         if (userCredential.user != null) {
//           Get.to(NameEmailScreen());
//         }

//         setState(() {
//           _user = userCredential.user;
//         });
//       }
//     } catch (error) {
//       // Print error in console
//       print("Google login failed: $error");
//     }
//   }

//   Future<void> _signOut() async {
//     await _auth.signOut();
//     await _googleSignIn.signOut();
//     setState(() {
//       _user = null;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     // Print the role when the user arrives at the register screen
//     print("Role: ${widget.role}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Custombackground(
//         bottomContainerHeight: screenHeight() * 0.5,
//         widget: Padding(
//           padding: EdgeInsets.only(
//             top: getHeight(82),
//           ),
//           child: Container(
//             margin: EdgeInsets.only(left: getWidth(18)),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(AppImagese.car),
//                 SizedBox(
//                   height: getHeight(10),
//                 ),
//                 Container(
//                   width: screenWidth() * 0.5,
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: widget.role == 'Driver'
//                               ? "Ai-based travel bookings for drivers by "
//                               : "Ai-based travel bookings by ",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: Theme.of(context)
//                                 .textTheme
//                                 .titleLarge
//                                 ?.fontSize,
//                           ),
//                         ),
//                         TextSpan(
//                           text: "“Rydleap”",
//                           style: TextStyle(
//                             color: AppColors.textYellow,
//                             fontSize: Theme.of(context)
//                                 .textTheme
//                                 .titleLarge
//                                 ?.fontSize,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             SizedBox(
//               height: getHeight(35),
//             ),

//             CustomPhoneInput(
//               controller: phoneController,
//             ),

// ////////////////////////////////////////// firebase/////////////////////////////////////////
//             CustomGradientButton(
//                 text: "Get Otp driver",
//                 onTap: () {
//                   print("object");
//                 }),
// ////////////////////////////////////////// firebase/////////////////////////////////////////

//             // widget.role == 'Driver'
//             //     ? CustomGradientButton(
//             //         text: "Get Otp driver",
//             //         onTap: () {
//             //           String phoneNumber = phoneController
//             //               .text; // Get the phone number from the controller
//             //           // otpController.sendOtp(phoneNumber,widget.role);
//             //           // Get.to(OtpScreen(), arguments: {
//             //           //   'phoneNumber':
//             //           //       phoneNumber, // Set phone number from user input
//             //           //   'role': widget.role,
//             //           // });
//             //         })
//             // : Obx(() {
//             //     return otpController.isLoading.value
//             //         ? CircularProgressIndicator()
//             //         : CustomGradientButton(
//             //             text: "get_otp".tr,
//             //             onTap: () {
//             //               String phoneNumber = phoneController
//             //                   .text; // Get the phone number from the controller
//             //               otpController.sendOtp(phoneNumber,widget.role);
//             //               Get.to(OtpScreen(), arguments: {
//             //                 'phoneNumber':
//             //                     phoneNumber, // Set phone number from user input
//             //                 'role': widget.role,
//             //               });
//             //             });
//             //   }),
//             Container(
//               // width: getWidth(120),
//               // height: 37,
//               decoration: BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(color: AppColors.diveiderColor))),
//               child: Text(
//                 "privacy_policy".tr,
//                 style: TextStyle(
//                   color: Color(0xffF9F9F9),
//                   fontSize: getWidth(14),
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             OrSignInWith(),
//             CustomGlassButton(
//               icon: AppIcons.googleIcon,
//               text: "sign_google".tr,
//               // onTap: _signInWithGoogle,
//               onTap: () {
//                 // print("object");
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (_) => LoginScreen()));
//               },
//             ),
//             CustomGlassButton(
//               icon: AppIcons.appleIcon,
//               text: "sign_apple".tr,
//               onTap: () {
//                 Get.to(ProfileScreen());
//               },
//             ),
//             CustomGlassButton(
//               icon: AppIcons.facebookIcon,
//               text: "sign_facebook".tr,
//               onTap: () {
//                 if (widget.role == 'User') {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => Home()));
//                 } else {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (_) => DriverDashboard()));
//                 }
//               },
//             ),
//             SizedBox(
//               height: getHeight(20),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
