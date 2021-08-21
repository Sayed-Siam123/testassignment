import 'package:get/get.dart';
import 'package:testassignment/controller/HomeController.dart';

class AppBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<HomeController>(() => HomeController());
  }

}