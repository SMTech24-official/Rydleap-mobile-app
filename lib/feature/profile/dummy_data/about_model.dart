import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/feature/auth/presentaion/screens/change_password.dart';
import 'package:rydleap/feature/payment_options/screen/payment_options_screen.dart';
import 'package:rydleap/feature/profile/widgets/balance/balance_screen.dart';
import 'package:rydleap/feature/profile/widgets/cashout/cashout.dart';
import 'package:rydleap/feature/profile/widgets/contact_support/contact_support.dart';
import 'package:rydleap/feature/profile/widgets/language/language_screen.dart';
import 'package:rydleap/feature/profile/widgets/notifcation/notification_screen.dart';
import 'package:rydleap/feature/profile/widgets/promotion_offers/promotion_offers.dart';
import 'package:rydleap/feature/profile/widgets/report_problem/report_problem.dart';
import 'package:rydleap/feature/profile/widgets/ride_history/ride_history.dart';
import 'package:rydleap/feature/profile/widgets/settings/settings_screen.dart';

class AboutModel {
  final String title;
  final String icon;
  final VoidCallback onTap;

  AboutModel({required this.title, required this.icon, required this.onTap});
}

//userItems
List<AboutModel> userItems = [
  AboutModel(
      title: "settings",
      icon: AppIcons.settings,
      onTap: () {
        Get.to(() => SettingsScreen());
      }),
  AboutModel(
      title: "promotion_offers",
      icon: AppIcons.promotion,
      onTap: () {
        Get.to(() => PromotionOffersScreen());
      }),
  AboutModel(
      title: "change_password",
      icon: AppIcons.key,
      onTap: () {
        Get.to(() => ChangePasswordScreen());
      }),
  AboutModel(
      title: "payment_methods",
      icon: AppIcons.payment,
      onTap: () {
        Get.to(() => PaymentOptionsScreen());
      }),
  AboutModel(
      title: "ride_history",
      icon: AppIcons.history,
      onTap: () {
        Get.to(() => RideHistoryScreen());
      }),
  AboutModel(
      title: "language",
      icon: AppIcons.language,
      onTap: () {
        Get.to(() => LanguageScreen());
      }),
  AboutModel(
      title: "report_problem",
      icon: AppIcons.report,
      onTap: () {
        Get.to(() => ReportProblemScreen());
      }),
  AboutModel(
      title: "contact_us",
      icon: AppIcons.contact,
      onTap: () {
        Get.to(() => ContactSupportScreen());
      }),
];

//driverItems
List<AboutModel> driverItems = [
  AboutModel(
      title: "settings",
      icon: AppIcons.settings,
      onTap: () {
        Get.to(() => SettingsScreen());
      }),
  AboutModel(
      title: "balance",
      icon: AppIcons.payment,
      onTap: () {
        Get.to(() => BalanceScreen());
      }),
  AboutModel(
      title: "cash_out",
      icon: AppIcons.payment,
      onTap: () {
        Get.to(() => CashoutScreen());
      }),
  AboutModel(
      title: "change_password",
      icon: AppIcons.key,
      onTap: () {
        Get.to(() => ChangePasswordScreen());
      }),
  AboutModel(
      title: "notifiactions",
      icon: AppIcons.notification,
      onTap: () {
        Get.to(() => NotificationScreen());
      }),
  AboutModel(
      title: "drive_history",
      icon: AppIcons.history,
      onTap: () {
        Get.to(() => RideHistoryScreen());
      }),
  AboutModel(
      title: "language",
      icon: AppIcons.language,
      onTap: () {
        Get.to(() => LanguageScreen());
      }),
  AboutModel(
      title: "report_problem",
      icon: AppIcons.report,
      onTap: () {
        Get.to(() => ReportProblemScreen());
      }),
  AboutModel(
      title: "Contact us",
      icon: AppIcons.contact,
      onTap: () {
        Get.to(() => ContactSupportScreen());
      }),
];
