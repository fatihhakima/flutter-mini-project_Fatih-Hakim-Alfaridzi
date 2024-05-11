import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
import 'package:mini_project_news/model/model_news_category.dart';
import 'package:mini_project_news/services/service_news_category.dart';
import 'package:mini_project_news/view/view_news_page.dart';

class ViewCategoryPage extends StatefulWidget {
  final String? category;

  const ViewCategoryPage({super.key, required this.category});

  @override
  State<ViewCategoryPage> createState() => _ViewCategoryPageState();
}

class _ViewCategoryPageState extends State<ViewCategoryPage> {
  late Future<List<ModelNewsCategory>> _newsCategoryFuture;

  @override
  void initState() {
    super.initState();
    _newsCategoryFuture =
        _fetchNewsCategory(widget.category ?? ''.toLowerCase());
  }

  Future<List<ModelNewsCategory>> _fetchNewsCategory(String category) async {
    try {
      return await ServiceNewsCategory().fetchNewsCategory(category);
    } catch (e) {
      print('Error fetching news: $e');
      throw Exception('Failed to fetch news');
    }
  }

  @override
  Widget build(BuildContext context) {
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
          future: _newsCategoryFuture,
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
              child: categoryNewsImage!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: categoryNewsImage ?? '',
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/image_error_placeholder.png'),
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
