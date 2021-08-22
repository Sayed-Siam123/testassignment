import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:testassignment/UI/base_widget.dart';
import 'package:testassignment/controller/HomeController.dart';
import 'package:testassignment/utils/color.dart';
import 'package:testassignment/utils/size.dart';
import 'package:testassignment/utils/style.dart';
import 'package:testassignment/widget/common_widget/common.dart';
import 'package:testassignment/widget/common_widget/loader.dart';

class FirstTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return BaseWidget(
      builder: (context, sizingInformation) {

        // print((large / 410) * sizingInformation.localWidgetSize.width);
        // print((medium / 410) * sizingInformation.localWidgetSize.width);
        // print((regular / 410) * sizingInformation.localWidgetSize.width);
        // print((small / 410) * sizingInformation.localWidgetSize.width);

        return GetBuilder<HomeController>(
          initState: (_){
            homeController.fetchTokenFreeListData();
          },
          init: HomeController(),
          builder: (controller) => SafeArea(
            child: Scaffold(
              appBar: appBar(back: true),
              backgroundColor: white,
              body: Builder(
                builder: (context) {

                  if(homeController.isLoading.isTrue){
                    return Loader();
                  }

                  return Container(
                    height: sizingInformation.localWidgetSize.height,
                    width: sizingInformation.localWidgetSize.width,
                    color: white,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    Padding(
                    padding: EdgeInsets.all(rootContainerSpacing),
                    child: Text("${homeController.get_tfl_list.getPackages.result.count.toString()} Available Holidays",style: lgFontStyleBold.copyWith(fontSize: fSize(fontSize: large,mediaQueryWidth: sizingInformation.localWidgetSize.width))),
                  ),
                  Expanded(
                  child: Container(
                  width: sizingInformation.localWidgetSize.width,
                  child: ListView.builder(
                            padding: EdgeInsets.fromLTRB(rootContainerSpacing,0,rootContainerSpacing,rootContainerSpacing),
                            shrinkWrap: true,
                            itemCount: homeController.get_tfl_list.getPackages.result.packages.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    height: sizingInformation.localWidgetSize.height*0.35,
                                    width: sizingInformation.localWidgetSize.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(boxRadius),
                                    ),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(boxRadius),
                                      ),
                                      elevation: cardElevation,
                                      color: white,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [

                                          Padding(
                                            padding: EdgeInsets.only(bottom: sizingInformation.localWidgetSize.height*0.1),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                       decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(boxRadius)),
                                                    ),
                                                    child: CachedNetworkImage(
                                                      imageUrl: homeController.get_tfl_list.getPackages.result.packages[index].thumbnail,
                                                      imageBuilder: (context, imageProvider) => Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(boxRadius)),
                                                          image: DecorationImage(
                                                              image: imageProvider,
                                                              fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      ),
                                                      placeholder: (context, url) => CircularProgressIndicator(),
                                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                                    ),
                                                  ),
                                                ),

                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    alignment: Alignment.topLeft,
                                                    decoration: BoxDecoration(
                                                        color: white,
                                                      borderRadius: BorderRadius.only(topRight: Radius.circular(boxRadius)),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.fromLTRB(12,6,12,6),
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Text("${homeController.get_tfl_list.getPackages.result.packages[index].title}",style: lgFontStyleBold.copyWith(fontSize: fSize(fontSize: large,mediaQueryWidth: sizingInformation.localWidgetSize.width), height: 1.5),),
                                                                SizedBox(height: sizingInformation.localWidgetSize.height*0.007,),
                                                                Expanded(
                                                                  child: Text("${homeController.get_tfl_list.getPackages.result.packages[index].description}",
                                                                    style: refontStyleRegular.copyWith(fontSize: fSize(fontSize: small,mediaQueryWidth: sizingInformation.localWidgetSize.width),color: preBlack,height: 1.2),overflow: TextOverflow.ellipsis,maxLines: 5,textAlign: TextAlign.left,),
                                                                ),
                                                              ],
                                                            ),
                                                          ),

                                                          Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Icon(FontAwesome5.calendar, size: sizingInformation.localWidgetSize.width*0.031,color: primaryColor,),
                                                                  SizedBox(width: sizingInformation.localWidgetSize.width*0.01,),
                                                                  Text("${homeController.get_tfl_list.getPackages.result.packages[index].durationText}",style: mdfontStyleMedium.copyWith(fontSize: fSize(fontSize: regular,mediaQueryWidth: sizingInformation.localWidgetSize.width)),),
                                                                ],
                                                              ),
                                                            ],
                                                          )

                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: sizingInformation.localWidgetSize.height*0.05,
                                                width: sizingInformation.localWidgetSize.width/4,
                                                decoration: BoxDecoration(
                                                    color: secondaryColor,
                                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(boxRadius),bottomRight: Radius.circular(boxRadius),)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Icon(FontAwesome.star,size: sizingInformation.localWidgetSize.width*0.03,),
                                                    SizedBox(width: sizingInformation.localWidgetSize.width*0.01,),
                                                    Text("Best Value",style: smFontStyleBold.copyWith(fontSize: fSize(fontSize: small,mediaQueryWidth: sizingInformation.localWidgetSize.width),),)
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: sizingInformation.localWidgetSize.height*0.1,
                                                width: sizingInformation.localWidgetSize.width,
                                                decoration: BoxDecoration(
                                                    color: primaryColor,
                                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(boxRadius),bottomRight: Radius.circular(boxRadius),)
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.fromLTRB(rootContainerSpacing,5,rootContainerSpacing,5),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text("Includes:",style: smfontStyleRegular.copyWith(color: secondaryColor,fontSize: fSize(fontSize: small,mediaQueryWidth: sizingInformation.localWidgetSize.width)),),
                                                          Text("Starts from",style: smfontStyleMedium.copyWith(color: white,fontSize: fSize(fontSize: small,mediaQueryWidth: sizingInformation.localWidgetSize.width)),),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: sizingInformation.localWidgetSize.height*0.045,
                                                        color: Colors.transparent,
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Container(
                                                              color: Colors.transparent,
                                                              width: sizingInformation.localWidgetSize.width/1.8,
                                                              child: ListView.builder(
                                                                padding: EdgeInsets.zero,
                                                                shrinkWrap: true,
                                                                scrollDirection: Axis.horizontal,
                                                                itemCount: homeController.get_tfl_list.getPackages.result.packages[index].amenities.length,
                                                                itemBuilder: (context, index1) {
                                                                  return Row(
                                                                    children: [
                                                                      SvgPicture.network("${homeController.get_tfl_list.getPackages.result.packages[index].amenities[index1].icon}",
                                                                        height: fSize(fontSize: small,mediaQueryWidth: sizingInformation.localWidgetSize.width),
                                                                        color: secondaryColor,
                                                                      ),
                                                                      SizedBox(width: sizingInformation.localWidgetSize.height*0.01,),
                                                                    ],
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                            Text("৳ ${NumberFormat.decimalPattern().format(homeController.get_tfl_list.getPackages.result.packages[index].startingPrice)}",style: lgFontStyleBold.copyWith(color: white,fontSize: fSize(fontSize: large,mediaQueryWidth: sizingInformation.localWidgetSize.width)),),
                                                          ],
                                                        ),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
