import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
import 'package:mini_project_news/model/model_news_article.dart';
import 'package:mini_project_news/services/service_news_article.dart';
import 'package:mini_project_news/view/view_news_page.dart';

class ViewAllArticlesPage extends StatefulWidget {
  const ViewAllArticlesPage({super.key});

  @override
  State<ViewAllArticlesPage> createState() => _ViewAllArticlesPageState();
}

class _ViewAllArticlesPageState extends State<ViewAllArticlesPage> {
  final ServiceNewsArticle _newsArticleService = ServiceNewsArticle();
  late Future<List<ModelNewsArticle>> _newsArticleFuture;

  @override
  void initState() {
    super.initState();
    _newsArticleFuture = _newsArticleService.fetchNewsArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Top ",
              style: ConstantTextStyle.oswaldBold,
            ),
            Text(
              'Headlines!',
              style: ConstantTextStyle.oswaldBold.copyWith(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future: _newsArticleFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error : ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            List<ModelNewsArticle> allArticle = snapshot.data!;
            return ListView.builder(
              itemCount: allArticle.length,
              itemBuilder: (context, index) {
                return ShowAllNewsArticle(
                  allNewsArticleImage: allArticle[index].urlToImage,
                  allNewsArticleTitle: allArticle[index].title,
                  allNewsArticleDesc: allArticle[index].description,
                  allNewsArticleUrl: allArticle[index].url,
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Data Available'),
            );
          }
        },
      ),
    );
  }
}

class ShowAllNewsArticle extends StatelessWidget {
  final String? allNewsArticleImage;
  final String? allNewsArticleTitle;
  final String? allNewsArticleDesc;
  final String? allNewsArticleUrl;

  const ShowAllNewsArticle({
    super.key,
    required this.allNewsArticleImage,
    required this.allNewsArticleTitle,
    required this.allNewsArticleDesc,
    required this.allNewsArticleUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewNewsPage(
                newsUrl: allNewsArticleUrl ?? '',
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: allNewsArticleImage!.isNotEmpty
                  ? CachedNetworkImage(
                      imageUrl: allNewsArticleImage ?? '',
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
              allNewsArticleTitle ?? '',
              style: ConstantTextStyle.latoBold.copyWith(fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              allNewsArticleDesc ?? '',
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
