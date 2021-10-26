import 'package:http/http.dart' as http;
import 'package:latamrock_app/model/category_model.dart';
import 'package:latamrock_app/model/news_model.dart';

class APIService {
  static Future<List<CategoriesModel>> fetchCategories() async {
    final response = await http.get(
        Uri.parse("https://latamrock.com/wp-json/wp/v2/categories?per_page=30"),
        headers: {"Accept": "application/json"});

    var jsonString = response.body;
    return categoriesModelFromJson(jsonString);
  }

  static Future<List<NewsModel>> fetchPosts(
      int categoryId, int pageNumber) async {
    final response = await http.get(
        Uri.parse(
            "https://latamrock.com/wp-json/wp/v2/latest-posts?page_size=5&category_id=$categoryId&page_no=$pageNumber"),
        headers: {"Accept": "application/json"});

    var jsonString = response.body;
    return newsModelFromJson(jsonString);
  }
}
