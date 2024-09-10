import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_save_button.dart';
import 'package:rydleap/core/global_widgets/global_variable.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/components/custom_profile_textfield.dart';
import 'package:rydleap/feature/profile/components/custom_switch_button.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool email = false;
  bool message = false;
  bool notifcation = false;
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.textBlack,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.appbarColor,
          leading: CustomCloseButton(),
          actions: [CustomSaveButton()],
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/Ellipse_9.png',
              width: 150.w,
              height: 50.h,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.only(
                left: getWidth(20),
                right: getWidth(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getHeight(40),
                    ),
                    //image section
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: getHeight(75),
                            width: getWidth(75),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(AppImagese.profileImage),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                            right: 8,
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
                    SizedBox(
                      height: getHeight(55),
                    ),
                    Text(
                      "Accounts",
                      style: GoogleFonts.nunito(
                          fontSize: getWidth(16), fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    CustomProfileTextfield(
                      controller: _nameController,
                      hinText: "Enter your name",
                      suffixIcon: AppIcons.edit,
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    CustomProfileTextfield(
                      keyboardType: TextInputType.number,
                      controller: _phoneController,
                      hinText: "Enter your number",
                      suffixIcon: AppIcons.edit,
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    CustomProfileTextfield(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      hinText: "Enter your email",
                      suffixIcon: AppIcons.edit,
                    ),
                    SizedBox(
                      height: getHeight(30),
                    ),
                    Text(
                      "Notifications",
                      style: GoogleFonts.nunito(
                          fontSize: getWidth(16), fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    CustomSwitchButton(
                      text: "Email",
                      value: email,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      color: email
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.02),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    CustomSwitchButton(
                      text: CustomGlobalVariable.userType == 'Driver'
                          ? "Auto Accept Ride Request"
                          : "Messages",
                      value: message,
                      onChanged: (value) {
                        setState(() {
                          message = value;
                        });
                      },
                      color: message
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.02),
                    ),
                    SizedBox(
                      height: getHeight(12),
                    ),
                    CustomSwitchButton(
                      text: "Notifications",
                      value: notifcation,
                      onChanged: (value) {
                        setState(() {
                          notifcation = value;
                        });
                      },
                      color: notifcation
                          ? Colors.white.withOpacity(0.1)
                          : Colors.white.withOpacity(0.02),
                    ),
                  ]),
            )
          ],
        ));
  }
}
