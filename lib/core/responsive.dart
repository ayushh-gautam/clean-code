import 'package:flutter/material.dart';

enum ResponsiveLayout { mobile, tablet, desktop }

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 650; //850

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static ResponsiveLayout layout(BuildContext context) {
    return isDesktop(context)
        ? ResponsiveLayout.desktop
        : isTablet(context)
            ? ResponsiveLayout.tablet
            : ResponsiveLayout.mobile;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= 650) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}


/*
Resolution	Pixels info
----------------------
540p / qHD                    =>  960×540 pixels
720p / HD                     =>  1280×720 pixels
1080p / Full HD / FHD	        =>  1920x1080 pixels
2K	                          =>  2048×1080 pixels
1440p / QHD / QuadHD / WQHD	  =>  2560×1440 pixels
2160p / UHD	                  =>  3840×2160 pixels
4K	                          =>  4096×2160 pixels
5K	                          =>  5120×2880 pixels
8K / 8K UHD	                  =>  7680×4320 pixels
 */