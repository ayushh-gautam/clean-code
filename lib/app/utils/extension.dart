import 'package:flutter/material.dart';

import 'app_color.dart';
import 'dimensions.dart';


extension ExtendedWidget on Widget {
  Widget addPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget addMargin(EdgeInsets padding) {
    return Container(
      margin: padding,
      child: this,
    );
  }

  Widget addBorderRadius(BuildContext context,
      {margin = const EdgeInsets.all(0)}) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppPadding.p8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 6,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: this,
    );
  }

  Widget addShadow({Offset? offset}) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0,
          blurRadius: 6,
          offset: offset ?? const Offset(0, 3), // changes position of shadow
        ),
      ]),
      child: this,
    );
  }
}

extension ExtendedInputBorder on Border {
  OutlineInputBorder inputOutlineBorderDecoration({context}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColor.darkTextFieldBorder
            : AppColor.lightTextFieldBorder,
      ),
      borderRadius: BorderRadius.circular(AppSize.s6),
    );
  }
}
