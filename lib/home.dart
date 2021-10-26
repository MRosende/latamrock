// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latamrock_app/controllers/categories_controller.dart';
import 'package:latamrock_app/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() {
        if (categoriesController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return DefaultTabController(
            length: categoriesController.categoriesList
                .where((p0) => (p0.parent == 0 && p0.name != "Sin categoría"))
                .length,
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Latamrock",
                    style: TextStyle(color: Colors.blue)),
                elevation: 0,
                backgroundColor: Colors.black,
                bottom: TabBar(
                  tabs: categoriesController.categoriesList
                      .where((p0) =>
                          (p0.parent == 0 && p0.name != "Sin categoría"))
                      .map((value) => tab(value.name!, value.parent!, value.id!,
                          categoriesController))
                      .toList(),
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.blue,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                ),
                actions: const <Widget>[
                  Icon(Icons.search, color: Colors.blue),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.notifications, color: Colors.blue),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: TabBarView(
                children: categoriesController.categoriesList
                    .where(
                        (p0) => (p0.parent == 0 && p0.name != "Sin categoría"))
                    .map((value) => NewsPage(
                          categoryID: value.id,
                        ))
                    .toList(),
              ),
            ),
          );
        }
      }),
    );
  }

  Widget tab(String tabName, int parent, int id,
      CategoriesController categoriesController) {
    if (parent == 0) {
      return Tab(
        text: tabName,
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
