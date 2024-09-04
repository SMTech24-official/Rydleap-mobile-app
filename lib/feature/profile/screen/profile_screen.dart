import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_blur_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/dummy_data/about_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  final String _imageKey = "stored_image_path";

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
        // _storeImagePath(image.path);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appbarColor,
          leading: SizedBox(
              height: getHeight(26),
              width: getWidth(26),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))),
          title: Text(
            "About me",
            style: GoogleFonts.inter(
                fontSize: getWidth(20), fontWeight: FontWeight.w600),
          ),
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getHeight(40),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          height: getHeight(54),
                          width: getWidth(54),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(AppImagese.profileImage)),
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
                      itemCount: aboutItems.length,
                      itemBuilder: (context, index) {
                        final data = aboutItems[index];
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
                              InkWell(
                                onTap: data.onTap,
                                child: Icon(
                                  Icons.arrow_forward_ios,
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
                    child: CustomBlurButton(
                      text: "Log Out",
                      textColor: CustomGlobalVariable.userType == 'Driver'
                          ? Color(0xffFE0F00)
                          : AppColors.textGrey,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
