import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/custom_close_button.dart';
import 'package:rydleap/core/global_widgets/custom_gradient_button.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverProfilePhoto extends StatefulWidget {
  const DriverProfilePhoto({super.key});

  @override
  State<DriverProfilePhoto> createState() => _DriverProfilePhotoState();
}

class _DriverProfilePhotoState extends State<DriverProfilePhoto> {
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  final String _imageKey = "stored_image_path";
  @override
  void initState() {
    super.initState();
    _loadStoredImage();
  }

  Future<void> _loadStoredImage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? imagePath = prefs.getString(_imageKey);
    if (imagePath != null && mounted) {
      _selectedImage = File(imagePath);
      setState(() {});
    }
  }

  Future<void> _storeImagePath(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_imageKey, path);
  }

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
                if (await _checkPermissions(ImageSource.camera)) {
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
      backgroundColor: AppColors.appbarColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appbarColor,
        title: Text(
          "Driver Registration",
          style: GoogleFonts.inter(
            fontSize: getWidth(20),
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: CustomCloseButton()
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getHeight(32),
            ),
            Text(
              "Upload your profile photo",
              style: GoogleFonts.inter(
                  fontSize: getWidth(25), fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: getHeight(58),
            ),
            //image section
            Center(
              child: Column(
                children: [
                  Container(
                    height: getHeight(144),
                    width: getWidth(144),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: _selectedImage != null
                            ? FileImage(_selectedImage!) as ImageProvider
                            : AssetImage(AppImagese.profileImageLarge),
                        fit: BoxFit
                            .cover, // This will make the image cover the entire container
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(0, -20),
                    child: InkWell(
                      onTap: () {
                        _showImageSourceSelection(context);
                      },
                      child: Container(
                        height: getHeight(37),
                        width: getWidth(114),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(51),
                          color: Color(0xff3AD896),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(AppIcons.upload),
                            SizedBox(
                                width: getWidth(
                                    8)), // Add spacing between the icon and text
                            Text(
                              "Upload",
                              style: GoogleFonts.nunito(
                                fontSize: getWidth(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: getHeight(12),
            ),
            //text section
            Center(
              child: Text(
                _selectedImage != null
                    ? "Submit this image if you think it's readable or tap on re-upload button to upload another one."
                    : "Make sure your Vehicle’s Make, Model, Year, Licence, Plate, VIN and expiration are clear and vesiable.",
                style: GoogleFonts.nunito(
                    color: Color(0xffE1E1E1),
                    fontSize: getWidth(12),
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            //buttons section
            Visibility(
                visible: _selectedImage != null,
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _showImageSourceSelection(context);
                        },
                        child: Container(
                          height: getHeight(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(88),
                              border:
                                  Border.all(color: Colors.white, width: 0.6)),
                          child: Center(
                              child: Text(
                            "Re-upload",
                            style: GoogleFonts.nunito(
                                fontSize: getWidth(17.5),
                                fontWeight: FontWeight.w400),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: getWidth(40),
                    ),
                    Expanded(
                      child: SizedBox(
                          height: getHeight(50),
                          child: CustomGradientButton(
                              text: "Submit", onTap: () {
                                _customBottomSheet(context);
                              })),
                    )
                  ],
                )),
            SizedBox(
              height: getHeight(20),
            )
          ],
        ),
      ),
    );
  }
  Future<dynamic> _customBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Make the bottom sheet take the full screen
      backgroundColor: Colors.transparent, // Transparent background
      barrierColor: Color(
          0xff001B26).withOpacity(0.8), // Semi-transparent black background for the barrier
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
                  height: getHeight(297),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        // height: getHeight(120),
                        width: getWidth(95),
                        child: Image.asset(AppImagese.application),
                      ),
                      Text(
                        'Your application submitted and is under review.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(17),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'You will be notified with application status.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          color: Color(0xff001B26),
                          fontSize: getWidth(12),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: getHeight(25),),
                      Container(
                        height: getHeight(37),
                        width: getWidth(114),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(51),
                          color: Color(0xff3AD896),
                        ),
                        child: Center(
                          child: Text(
                            "Done",
                            style: GoogleFonts.nunito(
                              fontSize: getWidth(12),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top:
                    getHeight(40), // Adjust the top margin for the close button
                right: getWidth(
                    20), // Adjust the right margin for the close button
                child: SizedBox(
                  height: getHeight(26),
                  width: getWidth(26),
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
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

}
