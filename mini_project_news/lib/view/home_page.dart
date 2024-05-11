import 'package:flutter/material.dart';
import 'package:mini_project_news/widget/custom_bottom_navigation_bar.dart';
import 'package:mini_project_news/widget/custom_news_carousel_slider.dart';
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomCarouselSlider(),
                SizedBox(height: 30),
                CustomCategory(),
                SizedBox(height: 4),
                CustomSectionSubtitle(title: 'Top Headlines!'),
                CustomNewsArticleListView(),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomBottomNavBar(
              currentIndexNavigation: _currentIndex,
              onTap: (index) => setState(() {
                _currentIndex = index;
                print(index);
              }),
            ),
          )
          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 0,
          //   child: CustomBottomNavBar()),
        ],
      ),
    );
  }
}
