import 'package:flutter/material.dart';
import 'package:mini_project_news/widget/custom_carousel_slider.dart';
import 'package:mini_project_news/widget/custom_category_list_view.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          CustomCategory(),
          SizedBox(height: 4),
          CustomCarouselSlider(),
        ],
      ),
    );
  }
}
