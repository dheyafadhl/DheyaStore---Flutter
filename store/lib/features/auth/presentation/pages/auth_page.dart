// // lib/features/auth/presentation/pages/auth_page.dart
// import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'login_page.dart';
// import 'signup_page.dart';

// class AuthPage extends StatefulWidget {
//   const AuthPage({super.key});

//   @override
//   State<AuthPage> createState() => _AuthPageState();
// }

// class _AuthPageState extends State<AuthPage> {
//   late LiquidController liquidController;

//   @override
//   void initState() {
//     super.initState();
//     liquidController = LiquidController();
//   }
  
//   // دالة للتبديل بين الصفحات
//   void toggleScreens() {
//     liquidController.animateToPage(
//       page: liquidController.currentPage == 0 ? 1 : 0,
//       duration: 600
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pages = [
//       LoginPage(onTap: toggleScreens),
//       SignupPage(onTap: toggleScreens),
//     ];

//     return Scaffold(
//       body: LiquidSwipe(
//         pages: pages,
//         liquidController: liquidController,
//         // يمكنك تفعيل السحب اليدوي لو أردت
//         enableLoop: false,
//         slideIconWidget: const Icon(Icons.arrow_back_ios, color: Colors.grey),
//         waveType: WaveType.liquidReveal,
//         fullTransitionValue: 600,
//         enableSideReveal: true,
//       ),
//     );
//   }
// }