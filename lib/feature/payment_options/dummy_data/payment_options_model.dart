import 'package:rydleap/core/app_icons.dart';

import '../../../core/app_imagese.dart';

class PaymentOptionsModel {
  final String icon,title;

  PaymentOptionsModel({required this.icon, required this.title});
}


List <PaymentOptionsModel>paymentItems=[
  PaymentOptionsModel(
      icon: AppImagese.debitAndCreditCard,
      title: "Debit Card or Credit Card"
  ),
  PaymentOptionsModel(
      icon: AppImagese.paypal,
      title: "Paypal"
  ),
  PaymentOptionsModel(
      icon: AppIcons.appleIcon,
      title: "Apple Pay"
  ),
  PaymentOptionsModel(
      icon: AppIcons.googleIcon,
      title: "Google Pay"
  ),
];