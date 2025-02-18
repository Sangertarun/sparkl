import 'package:flutter/material.dart';
import '../colors/app_colors.dart';
import '../values/dimensions.dart';



//CIRCLE_WITH_BORDER
final  containerAppCircle = BoxDecoration(shape: BoxShape.circle, color: Colors.transparent,border: Border.all(width: 1, color: AppColors.appColor));

//BOX_SHADOW
final containerBoxShadow_5 =  BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_5),color: AppColors.appWhite,
  boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(-5.0, 0.0),blurRadius: 3.0,spreadRadius: 0.2),],);
final containerBoxShadow_10 =  BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_10),color: AppColors.appWhite,
  boxShadow:  const [BoxShadow(color: Colors.black12, offset: Offset(-5.0, 0.0),blurRadius: 3.0,spreadRadius: 0.2),],);
final containerBoxShadow_15 =  BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_15),color: AppColors.appWhite,
  boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(-5.0, 0.0),blurRadius: 3.0,spreadRadius: 0.2),],);
final containerBoxShadow_20 =  BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_20),color: AppColors.appWhite,
  boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(-5.0, 0.0),blurRadius: 3.0,spreadRadius: 0.2),],);
final containerBoxShadow_25 =  BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_25),color: AppColors.appWhite,
  boxShadow: const [BoxShadow(color: Colors.black12,offset: Offset(-5.0, 0.0),blurRadius: 3.0,spreadRadius: 0.2),],);


//RADIUS
final containerRadius_5 =  BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_5),color: AppColors.appWhite,);
final containerRadius_10 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_10),color: AppColors.appWhite,);
final containerRadius_15 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_15),color: AppColors.appWhite,);
final containerRadius_20 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_20),color: AppColors.appWhite,);
final containerRadius_25 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_25),color: AppColors.appWhite,);
final containerRadius_30 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_30),color: AppColors.appWhite,);

//RADIUS_NOT_BOTTOM_LEFT
const containerNotBottomLeftRadius_5 = BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius_5),topRight: Radius.circular(Dimensions.radius_5),bottomRight: Radius.circular(Dimensions.radius_5)),color: AppColors.appWhite,);
const containerNotBottomLeftRadius_10 = BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius_10),topRight: Radius.circular(Dimensions.radius_20),bottomRight: Radius.circular(Dimensions.radius_20)),color: AppColors.appWhite,);
const containerNotBottomLeftRadius_15 = BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius_15),topRight: Radius.circular(Dimensions.radius_15),bottomRight: Radius.circular(Dimensions.radius_15)),color: AppColors.appWhite,);
const containerNotBottomLeftRadius_20 = BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius_20),topRight: Radius.circular(Dimensions.radius_20),bottomRight: Radius.circular(Dimensions.radius_20)),color: AppColors.appWhite,);
const containerNotBottomLeftRadius_25 = BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius_25),topRight: Radius.circular(Dimensions.radius_25),bottomRight: Radius.circular(Dimensions.radius_25)),color: AppColors.appWhite,);

//BORDER_RADIUS
final containerBorderRadius_5 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_5), border: Border.all(width: 1, color: AppColors.appColor));
final containerBorderRadius_10 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_10), border: Border.all(width: 1, color: AppColors.appColor));
final containerBorderRadius_8 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_8), border: Border.all(width: 1, color: AppColors.appColor));
final containerBorderRadius_15 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_15), border: Border.all(width: 1, color: AppColors.appColor));
final containerBorderRadius_20 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_20), border: Border.all(width: 1, color: AppColors.appColor));
final containerBorderRadius_25 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_25), border: Border.all(width: 1, color: AppColors.appColor));
final containerBorderRadius_30 = BoxDecoration(borderRadius: BorderRadius.circular(Dimensions.radius_30), border: Border.all(width: 1, color: AppColors.appColor));

//TOP_RADIUS
const containerTopRadius_5 = BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius_5)),color: AppColors.appWhite,);
const containerTopRadius_10 = BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius_10)),color: AppColors.appWhite,);
const containerTopRadius_15 = BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius_15)),color: AppColors.appWhite,);
const containerTopRadius_20 = BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius_20)),color: AppColors.appWhite,);
const containerTopRadius_25 = BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(Dimensions.radius_25)),color: AppColors.appWhite,);

//BOTTOM_RADIUS
const containerBottomRadius_5 = BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimensions.radius_5)),color: AppColors.appWhite,);
const containerBottomRadius_10 = BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimensions.radius_10)),color: AppColors.appWhite,);
const containerBottomRadius_15 = BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimensions.radius_15)),color: AppColors.appColor,);
const containerBottomRadius_20 = BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimensions.radius_20)),color: AppColors.appWhite,);
const containerBottomRadius_25 = BoxDecoration(borderRadius: BorderRadius.vertical(bottom: Radius.circular(Dimensions.radius_25)),color: AppColors.appColor,);

//RIGHT_RADIUS
const containerRightRadius_5 = BoxDecoration(borderRadius: BorderRadius.horizontal(right: Radius.circular(Dimensions.radius_5)),color: AppColors.appColor,);
const containerRightRadius_10 = BoxDecoration(borderRadius: BorderRadius.horizontal(right: Radius.circular(Dimensions.radius_10)),color: AppColors.appColor,);
const containerRightRadius_15 = BoxDecoration(borderRadius: BorderRadius.horizontal(right: Radius.circular(Dimensions.radius_15)),color: AppColors.appColor,);
const containerRightRadius_20 = BoxDecoration(borderRadius: BorderRadius.horizontal(right: Radius.circular(Dimensions.radius_20)),color: AppColors.appColor,);
const containerRightRadius_25 = BoxDecoration(borderRadius: BorderRadius.horizontal(right: Radius.circular(Dimensions.radius_25)),color: AppColors.appColor,);

//LEFT_RADIUS
const containerLeftRadius_5 = BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(Dimensions.radius_5)),color: AppColors.appColor,);
const containerLeftRadius_10 = BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(Dimensions.radius_10)),color: AppColors.appColor,);
const containerLeftRadius_15 = BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(Dimensions.radius_15)),color: AppColors.appColor,);
const containerLeftRadius_20 = BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(Dimensions.radius_20)),color: AppColors.appColor,);
const containerLeftRadius_25 = BoxDecoration(borderRadius: BorderRadius.horizontal(left: Radius.circular(Dimensions.radius_25)),color: AppColors.appColor,);



const containerBottomRightRadius_25 = BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),color: AppColors.appColor,);


