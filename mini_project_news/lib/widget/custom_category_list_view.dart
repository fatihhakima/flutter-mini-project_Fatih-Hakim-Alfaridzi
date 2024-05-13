import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
// import 'package:mini_project_news/model/model_custom_category.dart';
import 'package:mini_project_news/provider/provider_home_page.dart';
// import 'package:mini_project_news/services/category_data.dart';
import 'package:mini_project_news/view/view_category_page.dart';
import 'package:provider/provider.dart';

class CustomCategory extends StatefulWidget {
  const CustomCategory({super.key});

  @override
  State<CustomCategory> createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderHomePage>(context);

    return Container(
      margin: const EdgeInsets.only(left: 8),
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: provider.categories.length,
        itemBuilder: (context, index) {
          final category = provider.categories[index];
          return CustomCategoryTile(
            categoryTileName: category.categoryName,
            categoryTileImage: category.categoryImage,
          );
        },
      ),
    );
  }
}

class CustomCategoryTile extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final categoryTileName;
  // ignore: prefer_typing_uninitialized_variables
  final categoryTileImage;

  const CustomCategoryTile(
      {super.key, this.categoryTileName, this.categoryTileImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewCategoryPage(category: categoryTileName),));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(
                categoryTileImage,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Center(
                child: Text(
                  categoryTileName,
                  style: ConstantTextStyle.latoBold.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
