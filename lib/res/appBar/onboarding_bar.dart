import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sparkl/res/drawable/colors/app_colors.dart';
import 'package:sparkl/res/drawable/values/dimensions.dart';

class OnboardingBar extends StatelessWidget {
  final String screenName;
  final Widget body;

  const OnboardingBar({required this.screenName, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.appLightColor,
      appBar: Platform.isIOS
          ? null
          : PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          scrolledUnderElevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.appLightColor,
            statusBarColor: AppColors.appLightColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      extendBody: Platform.isIOS ? false : true,
      extendBodyBehindAppBar: Platform.isIOS ? false : true,
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (!didPop) {
            exit(0);
          }
        },
        child: SafeArea(
          top: true,
          bottom: true,
          child: Stack(
            children: [
              Positioned(
                top: screenName == "Page1"
                    ? h * 0.14
                    : screenName == "Page2"
                    ? h * 0.3
                    : screenName == "Page3"
                    ? h * 0.5
                    : 0,
                right: screenName == "Page1" || screenName == "Page3"
                    ? -h * 0.1
                    : 0,
                child: Container(
                  height: h * 0.3,
                  width: h * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.appLightColor,
                        AppColors.appTeal.withValues(alpha: (0.1)),
                        AppColors.appTeal.withValues(alpha: (0.1)),
                        AppColors.appTeal.withValues(alpha: (0.1)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(Dimensions.padding_15),
                child: body,
              )
            ],
          ),
        ),
      ),
    );
  }
}
