import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/home/home_controller.dart';
import 'package:rydleap/feature/auth/login/controller/login_controller.dart';
import 'package:rydleap/feature/profile/dummy_data/about_model.dart';
import 'package:rydleap/feature/profile/screen/profile_settings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  HomeController homeController=Get.find();


  final LoginController _loginController = Get.find<LoginController>();
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  final String _imageKey = "stored_image_path";

Future<void> _pickImage(ImageSource source) async {
  try {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null && mounted) { // Check if the widget is still mounted
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  } catch (e) {
    print('Failed to pick image: $e');
  }
}

  Future<bool> _checkPermissions(ImageSource source) async {
    if (source == ImageSource.camera) {
      final cameraStatus = await Permission.camera.status;
      if (cameraStatus.isGranted) {
        final result = await Permission.camera.request();
        return result.isGranted;
      }
    } else if (source == ImageSource.gallery) {
      final storageStatus = await Permission.photos.request();
      if (storageStatus.isGranted) {
        final result = await Permission.photos.request();
        return result.isGranted;
      }
    }
    return true;
  }

  void _showImageSourceSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.appbarColor,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Take a Photo'),
              onTap: () async {
                if (await _checkPermissions(ImageSource.gallery)) {
                  _pickImage(ImageSource.camera);
                }

                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text('Choose from Gallery'),
              onTap: () async {
                if (await _checkPermissions(ImageSource.gallery)) {
                  _pickImage(ImageSource.gallery);
                }

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent, // Transparent background
      barrierColor: Color(0xff001B26).withOpacity(0.8),
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center, // Center the container on the screen
          child: Stack(
            children: [
              Container(
                height: screenHeight(),
                width: double.infinity,
                color: Colors.transparent,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getWidth(38)),
                  height: getHeight(238),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Are you sure you want to Log Out?',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(18),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: getHeight(42),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: getHeight(40),
                            width: getWidth(104),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(88),
                                color: Color(0xff3AD896)),
                            child: Center(
                              child: Text(
                                "Wait",
                                style: GoogleFonts.inter(
                                    fontSize: getWidth(14),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: getWidth(16),
                          ),
                          InkWell(
                            onTap: () {
                              print("logout");
                            },
                            child: Container(
                              height: getHeight(40),
                              width: getWidth(104),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(88),
                                  color: Color(0xffF0F0F0)),
                              child: Center(
                                child: Text(
                                  "Log Out",
                                  style: GoogleFonts.inter(
                                      color: Color(0xff001B26),
                                      fontSize: getWidth(14),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: getHeight(40),
                right: getWidth(20),
                child: SizedBox(
                  height: getHeight(26),
                  width: getWidth(26),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context); // Close the bottom sheet
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (_) => LoginScreen()),
                      // );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appbarColor,
          leading: CustomCloseButton(),
          title: Text(
            "About me",
            style: GoogleFonts.inter(
                fontSize: getWidth(20), fontWeight: FontWeight.w600),
          ),
          actions: [
            Obx(() {
              if (_loginController.loading.value) {
                // Show loading indicator
                return Center(child: CircularProgressIndicator());
              } else {
                // Show the Confirm button if not loading
                return  IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _loginController.logout();
            },
          );
              }
            }),

          ],
        ),
        body: Stack(
          children: [
            Container(
              color: AppColors.textBlack,
            ),
            Image.asset(
              'assets/images/Ellipse_9.png',
              width: 150.w,
              height: 60.h,
              fit: BoxFit.cover,
            ),
            //online container
            CustomGlobalVariable.userType == 'Driver'
                ? Positioned(
                    top: getHeight(17),
                    right: getWidth(30),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                      ),
                      height: getHeight(18),
                      // width: getWidth(40),
                      decoration: BoxDecoration(
                          color: Color(0xff03989E),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Text(
                          "Online",
                          style: GoogleFonts.nunito(
                              fontSize: getWidth(10),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  )
                : SizedBox(),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(40),
                  ),
                  //profile image section
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: getHeight(54),
                          width: getWidth(54),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: _selectedImage != null
                                  ? FileImage(_selectedImage!)
                                  : AssetImage(AppImagese.profileImage)
                                      as ImageProvider<Object>,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 2,
                          child: InkWell(
                            onTap: () {
                              _showImageSourceSelection(context);
                            },
                            child: Container(
                              height: getHeight(16),
                              width: getWidth(16),
                              decoration: BoxDecoration(
                                color: Color(0xff001B26),
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(AppIcons.editProfile),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //profile section
                  Container(
                    width: getWidth(162),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Peace Unity",
                              style: GoogleFonts.nunito(
                                  fontSize: getWidth(18),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "(4.7⭐)",
                              style: GoogleFonts.nunito(
                                  color: AppColors.textYellow,
                                  fontSize: getWidth(12),
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Text(
                          "+123002765918",
                          style: GoogleFonts.nunito(
                              color: Color(0xffC3BBBB),
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "@gmail.com",
                          style: GoogleFonts.nunito(
                              color: Color(0xffC3BBBB),
                              fontSize: getWidth(15),
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(ProfileSettings());
                          },
                          child: Container(
                            height: getHeight(20),
                            width: getWidth(40),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Edit",
                                  style: GoogleFonts.nunito(
                                      color: Color(0xffB6B3B3),
                                      fontSize: getWidth(10),
                                      fontWeight: FontWeight.w400),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: getWidth(12),
                                  color: Color(0xffB6B3B3),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getHeight(27),
                  ),
                  Container(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                      shrinkWrap: true,
                      itemCount: CustomGlobalVariable.userType == 'Driver'
                          ? driverItems.length
                          : userItems.length,
                      itemBuilder: (context, index) {
                        final data = CustomGlobalVariable.userType == 'Driver'
                            ? driverItems[index]
                            : userItems[index];
                        return Container(
                          padding:
                              EdgeInsets.symmetric(vertical: getHeight(14.5)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xff545454), width: 0.6))),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: getHeight(22),
                                        width: getWidth(22),
                                        child: Image.asset(data.icon)),
                                    SizedBox(
                                      width: getWidth(24.5),
                                    ),
                                    Text(
                                      data.title,
                                      style: GoogleFonts.nunito(
                                          fontSize: getWidth(16),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              // IconButton(onPressed: data.onTap, icon: Icon(Icons.arrow_forward_ios,size: 16,))
                             ClipOval(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white.withOpacity(0.2),
                            onTap:data.onTap,
                            child: SizedBox(
                              height: getWidth(24),
                              width: getWidth(24),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: getHeight(30),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                    child: InkWell(
                      onTap: () {
                        _customBottomSheet(context);
                      },
                      child: CustomBlurButton(
                        text: "Log Out",
                        textColor: CustomGlobalVariable.userType == 'Driver'
                            ? Color(0xffFE0F00)
                            : AppColors.textGrey,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
