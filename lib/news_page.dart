// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latamrock_app/widget/news_widget.dart';
import 'controllers/posts_controller.dart';

class NewsPage extends StatefulWidget {
  int? categoryID;
  bool? isReload;
  int? totalRecords;

  NewsPage({
    this.categoryID,
    this.isReload,
    this.totalRecords,
  });

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsController newsController = Get.put(NewsController());
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  ScrollController _scrollController = new ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await newsController.fetchPosts(
        categoryId: this.widget.categoryID!,
        pageNumber: 1,
      );
    });

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await newsController.fetchPosts(
          pageNumber: ++_page,
          categoryId: this.widget.categoryID!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return newsList();
  }

  Widget newsList() {
    return Container(
      child: Obx(() {
        if (newsController.isLoading.value)
          return Center(
            child: CircularProgressIndicator(),
          );
        else
          return RefreshIndicator(
            key: refreshKey,
            onRefresh: () => newsController.fetchPosts(
                categoryId: this.widget.categoryID!, pageNumber: 0),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: newsController.postsList.length,
              controller: _scrollController,
              itemBuilder: (context, index) {
                if ((index == newsController.postsList.length - 1) &&
                    newsController.postsList.length <
                        this.widget.totalRecords!) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return NewsWidget(model: newsController.postsList[index]);
              },
            ),
          );
      }),
    );
  }
}
