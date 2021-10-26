// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:latamrock_app/model/news_model.dart';
import 'package:latamrock_app/services/api_services.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  RxList<NewsModel> postsList = List<NewsModel>.empty(growable: true).obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> fetchPosts({
    required int categoryId,
    int pageNumber = 0,
  }) async {
    try {
      if (postsList.isEmpty || pageNumber == 0) {
        isLoading(true);
        postsList.clear();
      }
      postsList.value = await APIService.fetchPosts(categoryId, pageNumber);
    } finally {
      isLoading(false);
    }
  }
}
