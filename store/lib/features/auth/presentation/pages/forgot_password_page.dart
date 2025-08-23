import 'package:flutter/material.dart';
import 'package:store/shared/widgets/animated_custom_text_field.dart';
import 'package:store/shared/widgets/auth_page_layout.dart';
import 'package:store/shared/widgets/primary_action_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late List<Animation<Offset>> _slideAnimations;

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    final slideIntervals = [
      const Interval(0.2, 0.8, curve: Curves.easeOut), // حركة حقل الإدخال
      const Interval(0.4, 1.0, curve: Curves.easeOut), // حركة الزر
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
    super.dispose();
  }

  void _sendResetLink() {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('تم إرسال رابط إعادة التعيين بنجاح!')),
          );
          Navigator.pop(context);
        }
      });
    }
  }

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- الشعار مضاف هنا بشكل صحيح ---
            Image.asset(
              'assets/images/logo.png',
              height: 120, 
            ),
            const SizedBox(height: 24),
            // ------------------------------------

            Text(
              'إعادة تعيين كلمة المرور',
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'أدخل بريدك الإلكتروني وسنرسل لك رابطًا لإعادة تعيين كلمة المرور',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 40),

            _buildAnimatedWidget(
              AnimatedCustomTextField(
                controller: _emailController,
                labelText: 'البريد الإلكتروني',
                prefixIcon: Icons.email_outlined,
                validator: (value) => (value == null || !value.contains('@'))
                    ? 'الرجاء إدخال بريد إلكتروني صحيح'
                    : null,
              ),
              _slideAnimations[0],
            ),
            const SizedBox(height: 32),

            _buildAnimatedWidget(
              PrimaryActionButton(
                text: 'إرسال الرابط',
                onPressed: _sendResetLink,
                isLoading: _isLoading,
              ),
              _slideAnimations[1],
            ),
            const SizedBox(height: 24),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('العودة لتسجيل الدخول',
                  style: TextStyle(color: theme.colorScheme.primary)),
            ),
          ],
        ),
      ),
    );
  }
}