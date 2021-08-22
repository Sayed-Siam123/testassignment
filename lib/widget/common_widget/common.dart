import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:testassignment/utils/color.dart';
import 'package:testassignment/utils/size.dart';
import 'package:testassignment/utils/style.dart';

AppBar appBar({bool back}){
  return AppBar(
    toolbarHeight: toolBarHeight,
    elevation: elevation,
    titleSpacing: back ? 0 : rootContainerSpacing,
    leadingWidth: back ? 40 : 0,
    backgroundColor: white,
    leading: back ? IconButton(
      onPressed: (){
        Get.back();
      },
      icon: Icon(Feather.arrow_left,color: primaryColor,),
    ) : SizedBox(width: 0,),
    title: RichText(
      text: TextSpan(
        text: 'FLIGHT',
        style: mdFontStyleBold.copyWith(fontSize: titleSize),
        children: <TextSpan>[
          TextSpan(text: 'LOCAL', style: mdfontStyleRegular.copyWith(fontSize: titleSize)),
        ],
      ),
    ),
  );
}