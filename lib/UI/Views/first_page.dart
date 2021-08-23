import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testassignment/UI/Views/first_task.dart';
import 'package:testassignment/UI/Views/second_task.dart';
import 'package:testassignment/UI/Views/third_task.dart';
import 'package:testassignment/UI/base_widget.dart';
import 'package:testassignment/controller/HomeController.dart';
import 'package:testassignment/utils/color.dart';
import 'package:testassignment/utils/size.dart';
import 'package:testassignment/utils/style.dart';
import 'package:testassignment/widget/common_widget/common.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => BaseWidget(
        builder: (context, sizingInformation) => SafeArea(
                child: Scaffold(
                appBar: appBar(back: false),
                backgroundColor: white,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: (){
                        Get.to(FirstTask());
                      },
                      child: Center(
                        child: Text("First Task",style: refontStyleMedium.copyWith(fontSize: fSize(fontSize: regular,mediaQueryWidth: sizingInformation.localWidgetSize.width)),),
                      ),
                    ),

                    SizedBox(height: rootContainerSpacing,),

                    OutlinedButton(
                      onPressed: (){
                        Get.to(SecondTask());
                      },
                      child: Center(
                        child: Text("Second Task",style: refontStyleMedium.copyWith(fontSize: fSize(fontSize: regular,mediaQueryWidth: sizingInformation.localWidgetSize.width)),),
                      ),
                    ),

                    SizedBox(height: rootContainerSpacing,),

                    OutlinedButton(
                      onPressed: (){
                        homeController.login();
                        //Get.to(ThirdTask());
                      },
                      child: Center(
                        child: Text("Third Task",style: refontStyleMedium.copyWith(fontSize: fSize(fontSize: regular,mediaQueryWidth: sizingInformation.localWidgetSize.width)),),
                      ),
                    ),
                  ],
                ),
            )
        ),
      ),
    );
  }
}
