import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testassignment/model/TokenFreeListFetchModel.dart';
import 'package:testassignment/repository/GraphQLConfig.dart';
import 'package:testassignment/repository/GraphQLProvider.dart';
import 'package:testassignment/widget/common_widget/common.dart';
import 'package:testassignment/widget/common_widget/loader.dart';

class HomeController extends GetxController{


  int quantity = 1;

  RxBool isLoading = false.obs;

  var tfl_list = TokenFreeListFetchModel().obs;
  TokenFreeListFetchModel get get_tfl_list => this.tfl_list.value;
  set set_tfl_list(TokenFreeListFetchModel value) => this.tfl_list = value.obs;


  var tfl_list2 = TokenFreeListFetchModel().obs;
  TokenFreeListFetchModel get get_tfl_list2 => this.tfl_list2.value;
  set set_tfl_list2(TokenFreeListFetchModel value) => this.tfl_list2 = value.obs;

  GraphQLProvider gqlProvider = GraphQLProvider();


  fetchTokenFreeListData() async{
    isLoading.value = true;
    if (isLoading.value == true) {
      print("STATUS _: "+isLoading.value.toString());
      //Get.dialog(Loader(text: "Logging in...",),barrierDismissible: false,useSafeArea: true);
      final response = await gqlProvider.getHolidayList();
      set_tfl_list = response;
      isLoading.value = false;
      update();
    }

    if (isLoading.value == false) {
      //Navigator.of(Get.context).pop(); //dismissing dialog
      //print("LENGTH IS: " + get_CategoryItem.category.children.length.toString());
    }
  }

  fetchTokenFreeListDataWithPagination({skip,limit}) async{
    isLoading.value = true;
    if (isLoading.value == true) {
      print("STATUS _: "+isLoading.value.toString());
      //Get.dialog(Loader(text: "Logging in...",),barrierDismissible: false,useSafeArea: true);
      final response = await gqlProvider.getHolidayListwithPagination(limit: limit,skip: skip);
      set_tfl_list2 = response;
      isLoading.value = false;
      update();
    }

    if (isLoading.value == false) {
      //Navigator.of(Get.context).pop(); //dismissing dialog
      //print("LENGTH IS: " + get_CategoryItem.category.children.length.toString());
    }
  }


  updateUI(){
    update();
  }
}