import 'package:flutter/material.dart';

class AnimatedCustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData prefixIcon;
  final bool isPassword;
  final String? Function(String?)? validator;

  const AnimatedCustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<AnimatedCustomTextField> createState() => _AnimatedCustomTextFieldState();
}

class _AnimatedCustomTextFieldState extends State<AnimatedCustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      validator: widget.validator,
      // استخدام TweenAnimationBuilder لتحريك خصائص الديكور
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.prefixIcon, color: theme.colorScheme.secondary),
        // إضافة زر لتبديل رؤية كلمة المرور
        suffixIcon: widget.isPassword
           ? IconButton(
                icon: Icon(
                  _obscureText? Icons.visibility_off : Icons.visibility,
                  color: theme.colorScheme.secondary,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText =!_obscureText;
                  });
                },
              )
            : null,
      ),
      style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurface),
    );
  }
}