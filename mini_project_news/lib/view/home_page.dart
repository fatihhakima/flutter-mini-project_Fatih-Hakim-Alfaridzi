import 'package:flutter/material.dart';
import 'package:mini_project_news/provider/provider_custom_bottom_navbar.dart';
import 'package:mini_project_news/widget/custom_bottom_navigation_bar.dart';
import 'package:mini_project_news/widget/custom_news_carousel_slider.dart';
import 'package:mini_project_news/widget/custom_category_list_view.dart';
import 'package:mini_project_news/widget/custom_news_article_list_view.dart';
import 'package:mini_project_news/widget/custom_section_subtitle.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentIndexProvider = Provider.of<ProviderBottomNavBar>(context);
    // ignore: unused_local_variable
    int currentIndex = currentIndexProvider.currentIndex;

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CustomCarouselSlider(),
            SizedBox(height: 30),
            CustomCategory(),
            CustomSectionSubtitle(title: 'Top Headlines!'),
            CustomNewsArticleListView(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
