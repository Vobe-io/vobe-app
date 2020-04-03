import 'dart:ui';

import 'package:flutter/material.dart';

class VobeTextField extends StatelessWidget {
  VobeTextField({
    this.icon,
    this.maxLength,
    this.inputType: TextInputType.text,
    this.obscure: false,
    this.hintText,
    this.controller,
  });

  final Icon icon;
  final TextInputType inputType;
  final TextEditingController controller;
  final int maxLength;
  final bool obscure;
  final String hintText;
  final Color bgColor = Color(0xFFf3f5f7);

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: TextField(
          controller: controller,
          showCursor: false,
          maxLength: maxLength,
          keyboardType: inputType,
          obscureText: obscure,
          decoration: InputDecoration(
            icon: icon,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
                fontWeight: FontWeight.w600, letterSpacing: obscure ? 2 : null),
          ),
        ),
      );
}
