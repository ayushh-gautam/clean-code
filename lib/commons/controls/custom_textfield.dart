// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../../app/utils/app_color.dart';
import '../../app/utils/dimensions.dart';


class CustomTextField extends StatefulWidget {
  final bool? obscureText;
  final TextEditingController controller;
  final String Function(String?)? validator;
  final Widget? prefix;
  final String? hintText;
  final BorderSide? borderSide;

  const CustomTextField({
    this.obscureText,
    required this.controller,
    this.validator,
    this.prefix,
    this.hintText,
    this.borderSide,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText ?? false,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: widget.prefix,
        contentPadding: const EdgeInsets.all(AppPadding.p10),
        hintText: widget.hintText,
        helperStyle: TextStyle(
          fontSize: FontSize.s20,
          color: AppColor.lightTextFieldBorder,
        ),
        border: OutlineInputBorder(
          borderSide: widget.borderSide ?? BorderSide.none,
          borderRadius: BorderRadius.circular(AppSize.s14),
        ),
      ),
    );
  }
}

// Add your AppPadding, FontSize, AppColor, and AppSize definitions here
