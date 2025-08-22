// lib/shared/widgets/glowing_text_field.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlowingTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  const GlowingTextField({super.key, required this.hintText, this.isPassword = false});

  @override
  _GlowingTextFieldState createState() => _GlowingTextFieldState();
}

class _GlowingTextFieldState extends State<GlowingTextField> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _glowAnimation;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _glowAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFB8CFCE).withOpacity(_glowAnimation.value * 0.5),
                blurRadius: 10 + (_glowAnimation.value * 10),
                spreadRadius: _glowAnimation.value * 3,
              ),
            ],
          ),
          child: child,
        );
      },
      child: TextField(
        focusNode: _focusNode,
        obscureText: widget.isPassword,
        style: GoogleFonts.poppins(color: const Color(0xFFEAEFEF)),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.poppins(color: const Color(0xFF7F8CAA)),
          filled: true,
          fillColor: const Color(0xFF333446),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}