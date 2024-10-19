import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/feature/profile/widgets/privacy_settings/privacy_settings_screen.dart';
import 'package:rydleap/feature/profile/widgets/settings/components/documents/documents.dart';
import 'package:rydleap/feature/safety_tips/safety_tips_screen.dart';
import 'package:rydleap/feature/terms_policy/terms_policy.dart';
import 'package:rydleap/feature/trip_summery/trip_summery_screen.dart';

class SettingsModel {
  final String icon, title;
  final VoidCallback onTap;

  SettingsModel({required this.icon, required this.title, required this.onTap});
}

List<SettingsModel> settingsItems = [
  SettingsModel(
      icon: AppIcons.note,
      title: "Documents",
      onTap: () {
        Get.to(DocumentsScreen());
      }),
  SettingsModel(
      icon: AppIcons.carIcon,
      title: "Vehicel",
      onTap: () {
        print("Vehicel");
      }),
  SettingsModel(
      icon: AppIcons.paymentIcon,
      title: "Payments",
      onTap: () {
        print("Payments");
      }),
  SettingsModel(
      icon: AppIcons.note,
      title: "Privacy",
      onTap: () {
        Get.to(PrivacySettingsScreen());
      }),
  SettingsModel(
      icon: AppIcons.carIcon,
      title: "Safety Tips",
      onTap: () {
        Get.to(SafetyTipsScreen());
      }),
  SettingsModel(
      icon: AppIcons.paymentIcon,
      title: "Trip Summery",
      onTap: () {
        Get.to(TripSummeryScreen());
      }),
  SettingsModel(
      icon: AppIcons.settings,
      title: "Terms and Policies",
      onTap: () {
        Get.to(TermsPolicyScreen());
      }),
];
