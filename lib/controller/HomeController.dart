import 'package:get/get.dart';
import 'package:testassignment/model/TokenFreeListFetchModel.dart';
import 'package:testassignment/repository/GraphQLConfig.dart';
import 'package:testassignment/repository/GraphQLProvider.dart';

class HomeController extends GetxController{

  GraphQLProvider gqlProvider = new GraphQLProvider();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();


  int quantity = 1;

  RxBool isLoading = false.obs;

  var tfl_list = TokenFreeListFetchModel().obs;
  TokenFreeListFetchModel get get_tfl_list => this.tfl_list.value;
  set set_tfl_list(TokenFreeListFetchModel value) => this.tfl_list = value.obs;

  fetchTokenFreeListData() async{
    // final data = await gqlProvider.getCategoryItemList(id: id);
    // print(data.category.children.length);

    isLoading.value = true;
    if (isLoading.value == true) {
      print("STATUS _: "+isLoading.value.toString());
      //Get.dialog(Loader(text: "Logging in...",),barrierDismissible: false);
      final response = await gqlProvider.getHolidayList();
      //print(response.isActive);
      set_tfl_list = response;
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