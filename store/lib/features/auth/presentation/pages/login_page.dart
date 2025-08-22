import 'package:flutter/material.dart';
import 'package:store/app/config/routes/app_routes.dart';
import 'package:store/shared/widgets/animated_custom_text_field.dart';
import 'package:store/shared/widgets/auth_page_layout.dart';
import 'package:store/shared/widgets/primary_action_button.dart';
import 'package:store/features/auth/presentation/pages/signup_page.dart'; // تأكد من صحة المسار

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late List<Animation<Offset>> _slideAnimations;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800), // زيادة المدة لتناسب عدد العناصر
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // ✅ تصحيح: تعريف 5 فترات زمنية لـ 5 عناصر متحركة
    final slideIntervals = [
      const Interval(0.0, 0.4, curve: Curves.easeOut), // العنوان الرئيسي
      const Interval(0.2, 0.6, curve: Curves.easeOut), // حقل الإيميل
      const Interval(0.4, 0.8, curve: Curves.easeOut), // حقل كلمة المرور
      const Interval(0.6, 1.0, curve: Curves.easeOut), // زر تسجيل الدخول
      const Interval(0.7, 1.0, curve: Curves.easeOut), // الروابط السفلية
    ];

    _slideAnimations = slideIntervals.map((interval) {
      return Tween<Offset>(begin: const Offset(0, 40), end: Offset.zero).animate(
        CurvedAnimation(parent: _controller, curve: interval),
      );
    }).toList();

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
           setState(() => _isLoading = false);
           // TODO: Navigate to home screen after successful login
        }
      });
    }
  }

  // ودجت متحرك مخصص لتجنب تكرار الكود
  Widget _buildAnimatedWidget(Widget child, Animation<Offset> slideAnimation) {
    // تم تبسيط الدالة لتستخدم SlideTransition مع FadeTransition
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AuthPageLayout(
      child: Form(
        key: _formKey,
        // ✅ تصحيح: تم وضع جميع العناصر داخل قائمة children للـ Column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. العنوان
            _buildAnimatedWidget(
              Text(
                'مرحباً بعودتك!',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              _slideAnimations[0], // استخدام الحركة الأولى
            ),
            const SizedBox(height: 8),
            Text(
              'سجل الدخول للمتابعة',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),

            // 2. حقل البريد الإلكتروني
            _buildAnimatedWidget(
              AnimatedCustomTextField(
                controller: _emailController,
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icons.email_outlined,
                validator: (value) =>
                    (value == null || !value.contains('@')) ? 'الرجاء إدخال بريد إلكتروني صحيح' : null,
              ),
              _slideAnimations[1], // استخدام الحركة الثانية
            ),
            const SizedBox(height: 20),

            // 3. حقل كلمة المرور
            _buildAnimatedWidget(
              AnimatedCustomTextField(
                controller: _passwordController,
                labelText: 'كلمة المرور',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                // ✅ تصحيح: تم إصلاح الخطأ المطبعي هنا
                validator: (value) =>
                    (value == null || value.length < 6) ? 'يجب أن تكون كلمة المرور 6 أحرف على الأقل' : null,
              ),
              _slideAnimations[2], // استخدام الحركة الثالثة
            ),
            const SizedBox(height: 32),

            // 4. زر تسجيل الدخول
            _buildAnimatedWidget(
              PrimaryActionButton(
                text: 'تسجيل الدخول',
                onPressed: _login,
                isLoading: _isLoading,
              ),
              _slideAnimations[3], // استخدام الحركة الرابعة
            ),
            const SizedBox(height: 24),

            // 5. الروابط الثانوية
            _buildAnimatedWidget(
              // ✅ تصحيح: تم إضافة العناصر داخل Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // الكود الصحيح (الطريقة الأولى)
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignupPage()),
                      );
                    },
                    child: const Text('ليس لديك حساب؟ إنشاء حساب'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.forgotPassword),
                    child: const Text('نسيت كلمة المرور؟'),
                  ),
                ],
              ),
              _slideAnimations[4], // استخدام الحركة الخامسة
            ),
          ],
        ),
      ),
    );
  }
}