import 'package:flutter/material.dart';
import 'package:store/shared/widgets/animated_custom_text_field.dart';
import 'package:store/shared/widgets/auth_page_layout.dart';
import 'package:store/shared/widgets/primary_action_button.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late List<Animation<Offset>> _slideAnimations;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000), // مدة أطول قليلاً
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // ✅ تصحيح: تعريف 6 فترات زمنية للعناصر المتحركة
    final slideIntervals = [
      const Interval(0.0, 0.4, curve: Curves.easeOut), // العنوان
      const Interval(0.2, 0.6, curve: Curves.easeOut), // حقل الاسم
      const Interval(0.4, 0.8, curve: Curves.easeOut), // حقل الإيميل
      const Interval(0.6, 1.0, curve: Curves.easeOut), // حقل كلمة المرور
      const Interval(0.8, 1.0, curve: Curves.easeOut), // زر إنشاء الحساب
      const Interval(0.9, 1.0, curve: Curves.easeOut), // رابط تسجيل الدخول
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signup() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        if(mounted){
          setState(() => _isLoading = false);
          // TODO: Navigate to the home page or verification page
        }
      });
    }
  }

  // دالة مساعدة لتطبيق الحركات على الويدجتس
  Widget _buildAnimatedWidget(Widget child, Animation<Offset> slideAnimation) {
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
                'إنشاء حساب جديد',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              _slideAnimations[0],
            ),
            const SizedBox(height: 8),
            Text(
              'املأ التفاصيل أدناه للبدء',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),

            // 2. حقل الاسم
            _buildAnimatedWidget(
              AnimatedCustomTextField(
                controller: _nameController,
                labelText: 'الاسم الكامل',
                prefixIcon: Icons.person_outline,
                validator: (value) => (value == null || value.isEmpty) ? 'الرجاء إدخال اسمك' : null,
              ),
              _slideAnimations[1], // استخدام الحركة الصحيحة
            ),
            const SizedBox(height: 20),

            // 3. حقل البريد الإلكتروني
            _buildAnimatedWidget(
              AnimatedCustomTextField(
                controller: _emailController,
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icons.email_outlined,
                validator: (value) => (value == null || !value.contains('@')) ? 'الرجاء إدخال بريد إلكتروني صحيح' : null,
              ),
              _slideAnimations[2], // استخدام الحركة الصحيحة
            ),
            const SizedBox(height: 20),

            // 4. حقل كلمة المرور
            _buildAnimatedWidget(
              AnimatedCustomTextField(
                controller: _passwordController,
                labelText: 'كلمة المرور',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
                validator: (value) => (value == null || value.length < 6) ? 'يجب أن تكون كلمة المرور 6 أحرف على الأقل' : null,
              ),
              _slideAnimations[3], // استخدام الحركة الصحيحة
            ),
            const SizedBox(height: 32),

            // 5. زر إنشاء الحساب
            _buildAnimatedWidget(
              PrimaryActionButton(
                text: 'إنشاء الحساب',
                onPressed: _signup,
                isLoading: _isLoading,
              ),
              _slideAnimations[4], // استخدام الحركة الصحيحة
            ),
            const SizedBox(height: 24),

            // 6. رابط تسجيل الدخول
            _buildAnimatedWidget(
              // ✅ تصحيح: تم إضافة العناصر داخل Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('لديك حساب بالفعل؟'),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('تسجيل الدخول'),
                  ),
                ],
              ),
              _slideAnimations[5], // استخدام الحركة الصحيحة
            ),
          ],
        ),
      ),
    );
  }
}