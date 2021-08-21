import 'package:flutter/material.dart';
import 'package:testassignment/utils/color.dart';
import 'package:testassignment/utils/size.dart';
import 'package:testassignment/utils/style.dart';

AppBar appBar(){
  return AppBar(
    toolbarHeight: toolBarHeight,
    elevation: elevation,
    backgroundColor: white,
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