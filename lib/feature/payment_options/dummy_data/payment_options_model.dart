import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rydleap/core/app_icons.dart';
import 'package:rydleap/feature/payment_options/widgets/custom_payment_method_screen.dart';

import '../../../core/app_imagese.dart';

class PaymentOptionsModel {
  final String icon, title;
  final VoidCallback onTap;
  PaymentOptionsModel(
      {required this.icon, required this.title, required this.onTap});
}

List<PaymentOptionsModel> paymentItems = [
  PaymentOptionsModel(
      icon: AppImagese.debitAndCreditCard,
      title: "Debit Card or Credit Card",
      onTap: () {}),
  PaymentOptionsModel(
      icon: AppImagese.paypal,
      title: "Pay Pal",
      onTap: () {
        Get.to(CustomPaymentMethodScreen(
          title: 'Pay Pal',
          subtitle: 'Use Pay Pal for quick and secure payments',
          imagePath: AppImagese.payPalLarge,
          bottomText: 'Link Pay Pal',
        ));
      }),
  PaymentOptionsModel(
      icon: AppIcons.appleIcon,
      title: "Apple Pay",
      onTap: () {
        Get.to(CustomPaymentMethodScreen(
          title: 'Apple Pay',
          subtitle: 'Use Apple Pay for quick and secure payments',
          imagePath: AppImagese.appleLarge,
          bottomText: 'Link Apply Pay',
        ));
      }),
  PaymentOptionsModel(
      icon: AppIcons.googleIcon,
      title: "Google Pay",
      onTap: () {
        Get.to(CustomPaymentMethodScreen(
          title: 'Google Pay',
          subtitle: 'Use Google Pay for quick and secure payments',
          imagePath: AppImagese.googleLarge,
          bottomText: 'Link Google Pay',
        ));
      }),
];
