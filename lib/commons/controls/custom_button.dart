import 'package:flutter/material.dart';

import '../../app/utils/app_color.dart';
import '../../app/utils/dimensions.dart';



class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double? radius;
  final double? width;
  final double? height;
  final Color? color;
  final String? text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? widget;

  const CustomButton({
    this.onTap,
    this.radius,
    this.width,
    this.height,
    this.color,
    this.text,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
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
        child: text != null
            ? Text(
                text!,
                style: TextStyle(
                  fontSize: fontSize ?? 20,
                  color: textColor ?? AppColor.black,
                  fontWeight: fontWeight ?? FontWeightManager.bold,
                ),
              )
            : widget);
  }
}

// Replace AppColor and FontWeightManager with your actual definitions
