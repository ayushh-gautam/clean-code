// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'app_color.dart';
import 'dimensions.dart';



abstract class CommonWidgets {
  static Widget myTextField({
    bool? obscureText,
    required TextEditingController controller,
    String Function(String?)? validator,
    Widget? prefix,
    String? hintText,
    BorderSide? borderSide,
  }) {
    return TextFormField(
      obscureText: obscureText ?? false,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: prefix,
        contentPadding: const EdgeInsets.all(AppPadding.p10),
        hintText: hintText,
        helperStyle: TextStyle(
            fontSize: FontSize.s20, color: AppColor.lightTextFieldBorder),
        border: OutlineInputBorder(
            borderSide: borderSide ?? BorderSide.none,
            
            borderRadius: BorderRadius.circular(AppSize.s14)),
      ),
    );
  }

  static Widget myButton({
    VoidCallback? onTap,
    double? radius,
    double? width,
    double? height,
    Color? color,
    required String text,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 100),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(width ?? 350, height ?? 55),
        ),
        backgroundColor: MaterialStateProperty.all(
          color ?? AppColor.primaryYellow,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 20,
          color: textColor ?? AppColor.black,
          fontWeight: fontWeight ?? FontWeightManager.bold,
        ),
      ),
    );
  }
}
