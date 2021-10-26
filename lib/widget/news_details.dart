// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:latamrock_app/utilities/layout_utility.dart';

class NewsDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "https://latamrock.com/wp-content/uploads/2021/08/LatamRock-YouTube-cap-18-1024x576.jpg",
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            expandedHeight: 250,
          ),
          SliverFillRemaining(
            child: Text("sss"),
          )
        ],
      ),
    );
  }

  Widget newsDetailSection() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          row1(),
          LayoutUtils.iconText(Icon(Icons.timer), Text("01st Jan 2021")),
          SizedBox(
            height: 15,
          ),
          Text(
            "First news",
            style: TextStyle(
                fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            child: Divider(color: Colors.grey, thickness: 2),
            width: 100,
          ),
          Expanded(
              child: Html(
            style: {"p": Style(color: Colors.grey, fontSize: FontSize.larger)},
            data: "<p>Test News</p><p>Test news paragraph 2</p>",
          ))
        ],
      ),
    );
  }

  Widget row1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "Sports",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            children: [
              IconButton(onPressed: null, icon: Icon(Icons.nightlight)),
              IconButton(onPressed: null, icon: Icon(Icons.book))
            ],
          ),
        )
      ],
    );
  }
}
