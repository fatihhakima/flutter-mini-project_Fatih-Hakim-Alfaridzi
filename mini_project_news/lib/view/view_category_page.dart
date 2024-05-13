import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
// import 'package:mini_project_news/model/model_news_category.dart';
import 'package:mini_project_news/provider/provider_view_category_page.dart';
// import 'package:mini_project_news/services/service_news_category.dart';
import 'package:mini_project_news/view/view_news_page.dart';
import 'package:provider/provider.dart';

class ViewCategoryPage extends StatefulWidget {
  final String? category;

  const ViewCategoryPage({super.key, required this.category});

  @override
  State<ViewCategoryPage> createState() => _ViewCategoryPageState();
}

class _ViewCategoryPageState extends State<ViewCategoryPage> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderViewCategory>(context);
    final String category = widget.category ?? '';

    provider.fetchNewsCategory(category);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category ?? '',
            style: ConstantTextStyle.oswaldBold.copyWith(
              color: Colors.blue,
            ),
          ),
          elevation: 0,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: provider.newsCategoryFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error : ${snapshot.error}'),
              );
            } else {
              final newsCategories = snapshot.data!;
              return ListView.builder(
                itemCount: newsCategories.length,
                itemBuilder: (context, index) {
                  return ShowCategoryNewsArticle(
                    categoryNewsImage: newsCategories[index].urlToImage,
                    categoryNewsTitle: newsCategories[index].title,
                    categoryNewsDesc: newsCategories[index].description,
                    categoryNewsUrl: newsCategories[index].url,
                  );
                },
              );
            }
          },
        ));
  }
}

class ShowCategoryNewsArticle extends StatelessWidget {
  final String? categoryNewsImage;
  final String? categoryNewsTitle;
  final String? categoryNewsDesc;
  final String? categoryNewsUrl;

  const ShowCategoryNewsArticle({
    super.key,
    required this.categoryNewsImage,
    required this.categoryNewsTitle,
    required this.categoryNewsDesc,
    required this.categoryNewsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ViewNewsPage(newsUrl: categoryNewsUrl ?? ''),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                categoryNewsImage ?? '',
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: SizedBox(
                      height: 120,
                      width: 120,
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/image_error_placeholder.png',
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  );
                },
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              categoryNewsTitle ?? '',
              style: ConstantTextStyle.latoBold.copyWith(fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              categoryNewsDesc ?? '',
              style: ConstantTextStyle.latoReg.copyWith(fontSize: 14),
              maxLines: 3,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
