import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/core/app_imagese.dart';
import 'package:rydleap/core/app_sizes.dart';
import 'package:rydleap/core/global_widgets/app_texts/custom_text_nunito.dart';
import 'package:rydleap/core/utility/app_colors.dart';
import 'package:rydleap/feature/profile/controller/firebase/f_profile_controller.dart';
import 'package:rydleap/feature/profile/dummy_data/about_model.dart';
import 'package:rydleap/feature/profile/screen/profile_settings.dart';

class CustomProfileSection extends StatefulWidget {
  const CustomProfileSection({
    super.key,
    required this.userData,
  });

  final Map<String, dynamic> userData;

  @override
  State<CustomProfileSection> createState() => _CustomProfileSectionState();
}

class _CustomProfileSectionState extends State<CustomProfileSection> {
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  final String _imageKey = "stored_image_path";

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null && mounted) {
        // Check if the widget is still mounted
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextNunito(
                text: "Peace Unity",
                fontSize: getWidth(18),
                fontWeight: FontWeight.w500),
            SizedBox(
              width: getWidth(5),
            ),
            CustomTextNunito(
                text: "(4.7⭐)",
                fontSize: getWidth(12),
                color: AppColors.textYellow,
                fontWeight: FontWeight.w500),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextNunito(
                text: " ${widget.userData['email'] ?? 'N/A'}",
                color: AppColors.hintext,
                fontSize: getWidth(15),
                fontWeight: FontWeight.w400),
            CustomTextNunito(
                text: "${widget.userData['phone'] ?? 'N/A'}",
                color: AppColors.hintext,
                fontSize: getWidth(15),
                fontWeight: FontWeight.w400),
          ],
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
                CustomTextNunito(
                    text: "Edit",
                    color: Color(0xffB6B3B3),
                    fontSize: getWidth(10),
                    fontWeight: FontWeight.w400),
                Icon(
                  Icons.arrow_drop_down,
                  size: getWidth(12),
                  color: Color(0xffB6B3B3),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
