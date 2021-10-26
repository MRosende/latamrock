import 'package:get/get.dart';
import 'package:latamrock_app/model/category_model.dart';
import 'package:latamrock_app/services/api_services.dart';

class CategoriesController extends GetxController {
  var isLoading = true.obs;
  RxList<CategoriesModel> categoriesList =
      List<CategoriesModel>.empty(growable: true).obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true);
      categoriesList.value = await APIService.fetchCategories();
    } finally {
      isLoading(false);
    }
  }
}
