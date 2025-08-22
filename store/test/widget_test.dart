import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// Make sure this import path correctly points to your login page file
import 'package:store/features/auth/presentation/pages/login_page.dart';

void main() {
  testWidgets('Login Page renders all initial widgets correctly', (WidgetTester tester) async {
    // Build the LoginPage inside a MaterialApp
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // Verify that the main title and other texts are visible
    expect(find.text('مرحباً بعودتك!'), findsOneWidget);
    expect(find.text('سجل الدخول للمتابعة'), findsOneWidget);

    // Verify that the email and password fields are visible
    expect(find.widgetWithText(TextFormField, 'البريد الإلكتروني'), findsOneWidget);
    expect(find.widgetWithText(TextFormField, 'كلمة المرور'), findsOneWidget);

    // Verify that the login button is visible
    expect(find.widgetWithText(ElevatedButton, 'تسجيل الدخول'), findsOneWidget);
  });
}