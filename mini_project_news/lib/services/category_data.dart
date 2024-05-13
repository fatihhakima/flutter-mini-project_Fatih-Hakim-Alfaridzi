import 'package:mini_project_news/model/model_custom_category.dart';

class ServiceCategoryData {
  List<CustomCategoryModel> getCategories() {
    List<CustomCategoryModel> category = [];
    CustomCategoryModel customCategoryModel = CustomCategoryModel();

    customCategoryModel.categoryName = 'Business';
    customCategoryModel.categoryImage = 'assets/business.png';
    category.add(customCategoryModel);
    customCategoryModel = CustomCategoryModel();

    customCategoryModel.categoryName = 'Entertainment';
    customCategoryModel.categoryImage = 'assets/entertainment.png';
    category.add(customCategoryModel);
    customCategoryModel = CustomCategoryModel();

    customCategoryModel.categoryName = 'Health';
    customCategoryModel.categoryImage = 'assets/health.png';
    category.add(customCategoryModel);
    customCategoryModel = CustomCategoryModel();

    customCategoryModel.categoryName = 'Science';
    customCategoryModel.categoryImage = 'assets/science.png';
    category.add(customCategoryModel);
    customCategoryModel = CustomCategoryModel();

    customCategoryModel.categoryName = 'Sport';
    customCategoryModel.categoryImage = 'assets/sport.png';
    category.add(customCategoryModel);
    customCategoryModel = CustomCategoryModel();

    customCategoryModel.categoryName = 'Technology';
    customCategoryModel.categoryImage = 'assets/technology.png';
    category.add(customCategoryModel);
    customCategoryModel = CustomCategoryModel();

    return category;
  }
}
