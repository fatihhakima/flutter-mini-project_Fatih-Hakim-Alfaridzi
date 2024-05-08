import 'package:flutter/material.dart';
import 'package:mini_project_news/widget/custom_carousel_slider.dart';
import 'package:mini_project_news/widget/custom_category_list_view.dart';
import 'package:mini_project_news/widget/custom_news_article_list_view.dart';
import 'package:mini_project_news/widget/custom_section_subtitle.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCategory(),
            SizedBox(height: 4),
            CustomSectionSubtitle(title: 'Breaking News'),
            SizedBox(height: 10,),
            CustomCarouselSlider(),
            SizedBox(height: 24,),
            CustomSectionSubtitle(title: 'Trending News'),
            SizedBox(height: 10),
            CustomNewsArticleListView(),
            SizedBox(height: 4),
            CustomNewsArticleListView(),
            SizedBox(height: 4),
            CustomNewsArticleListView(),
          ],
        ),
      ),
    );
  }
}
