// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rydleap/core/app_imagese.dart';
// import 'package:rydleap/core/utility/app_colors.dart';
// import 'package:rydleap/feature/auth/registration/controller/email_registration_controller.dart';

// class CheckScreen extends StatelessWidget {
//   final controller = Get.put(EmailRegistrationController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 100),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Get Registration First",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   Center(
//                     child: Stack(
//                       children: [
//                         Obx(() => Card(
//                               shape: const CircleBorder(),
//                               child: ClipOval(
//                                 child: Container(
//                                   height: 150,
//                                   width: 150,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     image: DecorationImage(
//                                       image: controller.selectedImage.value !=
//                                               null
//                                           ? FileImage(
//                                               controller.selectedImage.value!)
//                                           : const AssetImage(AppImagese.appLogo)
//                                               as ImageProvider<Object>,
//                                       fit: BoxFit.fill,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             )),
//                         Positioned(
//                           bottom: 5,
//                           right: 15,
//                           child: Card(
//                             shape: const CircleBorder(),
//                             child: ClipOval(
//                               child: InkWell(
//                                 onTap: () {
//                                   controller.showImageSourceSelection(context);
//                                 },
//                                 child: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     border: Border.all(
//                                       width: 2.0,
//                                     ),
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: Icon(
//                                     Icons.camera_alt,
//                                     size: 16,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   TextField(
//                     controller: controller.firstNameController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.person_outline),
//                       hintText: "First Name",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: controller.lastNameController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.person_outline),
//                       hintText: "Last Name",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     items: ["Admin", "User", "Guest"]
//                         .map((role) => DropdownMenuItem(
//                               value: role,
//                               child: Text(role),
//                             ))
//                         .toList(),
//                     onChanged: (String? role) {
//                       controller.selectedRole.value = role!;
//                     },
//                     hint: const Text("Select Role"),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: controller.emailController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.email_outlined),
//                       hintText: "Email",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: controller.passwordController,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.key_outlined),
//                       hintText: "Password",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   TextField(
//                     controller: controller.phoneController,
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.phone),
//                       hintText: "Phone Number",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 40),
//                   Obx(() {
//                     if (controller.isLoading.value) {
//                       return const Center(child: CircularProgressIndicator());
//                     } else {
//                       return SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: () {
//                             controller.onSignUp();
//                           },
//                           style: ElevatedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                           ),
//                           child: const Text(
//                             "Sign Up",
//                             style: TextStyle(fontSize: 18),
//                           ),
//                         ),
//                       );
//                     }
//                   }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
