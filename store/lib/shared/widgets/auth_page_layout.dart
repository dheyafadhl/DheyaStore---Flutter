import 'package:flutter/material.dart';

class AuthPageLayout extends StatelessWidget {
  final Widget child;

  const AuthPageLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        // ✅ تصحيح: تم إضافة قائمة الألوان للتدرج اللوني
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // استخدام ألوان من الثيم الحالي للتناسق
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.primary.withOpacity(0.3),
            ],
          ),
        ),
        child: Stack(
          children: [
            // ✨ تحسين: إضافة شكل دائري في الخلفية لمسة جمالية
            Positioned(
              top: -size.width * 0.3,
              right: -size.width * 0.4,
              child: Container(
                width: size.width * 0.9,
                height: size.width * 0.9,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // المحتوى الرئيسي للصفحة
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}