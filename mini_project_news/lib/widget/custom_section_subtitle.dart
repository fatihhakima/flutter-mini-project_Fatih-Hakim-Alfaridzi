import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
import 'package:mini_project_news/view/view_all_news_article_page.dart';

class CustomSectionSubtitle extends StatelessWidget {
  final String title;

  const CustomSectionSubtitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: ConstantTextStyle.latoBold.copyWith(fontSize: 16),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewAllArticlesPage(),));
            },
            child: Text(
              'View All',
              style: ConstantTextStyle.latoReg.copyWith(
                color: Colors.blue,
                fontSize: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
