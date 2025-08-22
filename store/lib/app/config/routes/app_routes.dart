import 'package:flutter/material.dart';
import 'package:store/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:store/features/auth/presentation/pages/login_page.dart';
import 'package:store/features/auth/presentation/pages/signup_page.dart';

class AppRoutes {
  // تعريف أسماء المسارات كثوابت لتجنب الأخطاء الإملائية
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgotPassword = '/forgot-password';

  // خريطة تربط أسماء المسارات بالصفحات المقابلة
  static final Map<String, WidgetBuilder> routes = {
    login: (context) => const LoginPage(),
    signup: (context) => const SignupPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
  };
}