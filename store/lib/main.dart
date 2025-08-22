import 'package:flutter/material.dart';
import 'package:store/app/config/routes/app_routes.dart';
import 'package:store/app/config/themes/app_theme.dart';
import 'package:store/features/auth/presentation/pages/login_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      // إزالة شارة التصحيح من الواجهة
      debugShowCheckedModeBanner: false,
      // تطبيق السمة المخصصة على مستوى التطبيق بالكامل
      theme: AppTheme.lightTheme,
      // تحديد الصفحة الرئيسية الأولية
      home: const LoginPage(),
      // استخدام نظام التوجيه المركزي لإدارة التنقل
      routes: AppRoutes.routes,
    );
  }
}