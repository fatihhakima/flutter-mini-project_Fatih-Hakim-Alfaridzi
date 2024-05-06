import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mini_project_news/constant/text_style_constant.dart';
import 'package:mini_project_news/model/custom_category_model.dart';

List<CustomCategoryModel> getCategories() {
  List<CustomCategoryModel> category = [];
  CustomCategoryModel customCategoryModel = new CustomCategoryModel();

  customCategoryModel.categoryName = 'Business';
  customCategoryModel.categoryImage = 'assets/business.png';
  category.add(customCategoryModel);
  customCategoryModel = new CustomCategoryModel();

  customCategoryModel.categoryName = 'Entertainment';
  customCategoryModel.categoryImage = 'assets/entertainment.png';
  category.add(customCategoryModel);
  customCategoryModel = new CustomCategoryModel();

  customCategoryModel.categoryName = 'General';
  customCategoryModel.categoryImage = 'assets/general.png';
  category.add(customCategoryModel);
  customCategoryModel = new CustomCategoryModel();

  customCategoryModel.categoryName = 'Health';
  customCategoryModel.categoryImage = 'assets/health.png';
  category.add(customCategoryModel);
  customCategoryModel = new CustomCategoryModel();

  customCategoryModel.categoryName = 'Science';
  customCategoryModel.categoryImage = 'assets/science.png';
  category.add(customCategoryModel);
  customCategoryModel = new CustomCategoryModel();

  customCategoryModel.categoryName = 'Sport';
  customCategoryModel.categoryImage = 'assets/sport.png';
  category.add(customCategoryModel);
  customCategoryModel = new CustomCategoryModel();

  customCategoryModel.categoryName = 'Technology';
  customCategoryModel.categoryImage = 'assets/technology.png';
  category.add(customCategoryModel);
  customCategoryModel = new CustomCategoryModel();

  return category;
}

class CustomCategory extends StatefulWidget {
  const CustomCategory({super.key});

  @override
  State<CustomCategory> createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  List<CustomCategoryModel> categories = [];

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8),
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CustomCategoryTile(
            categoryTileName: categories[index].categoryName,
            categoryTileImage: categories[index].categoryImage,
          );
        },
      ),
    );
  }
}

class CustomCategoryTile extends StatelessWidget {
  final categoryTileName;
  final categoryTileImage;

  const CustomCategoryTile(
      {super.key, this.categoryTileName, this.categoryTileImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
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
                style: TextStyleConstant.latoBold.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
