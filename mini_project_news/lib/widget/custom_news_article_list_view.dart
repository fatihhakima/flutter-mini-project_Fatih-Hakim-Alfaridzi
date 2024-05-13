import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
import 'package:mini_project_news/model/model_news_article.dart';
import 'package:mini_project_news/provider/provider_home_page.dart';
// import 'package:mini_project_news/services/service_news_article.dart';
import 'package:mini_project_news/view/view_news_page.dart';
import 'package:provider/provider.dart';

class CustomNewsArticleListView extends StatefulWidget {
  const CustomNewsArticleListView({super.key});

  @override
  State<CustomNewsArticleListView> createState() =>
      _CustomNewsArticleListViewState();
}

class _CustomNewsArticleListViewState extends State<CustomNewsArticleListView> {
  // final ServiceNewsArticle _newsArticleService = ServiceNewsArticle();
  // late Future<List<ModelNewsArticle>> _newsArticleFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   _newsArticleFuture = _newsArticleService.fetchNewsArticle();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderHomePage>(
      builder: (context, provider, child) {
        final newsArticleFuture = provider.getNewsArticleFuture();
        return FutureBuilder<List<ModelNewsArticle>>(
          future: newsArticleFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<ModelNewsArticle> newsArticle = snapshot.data!;
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: newsArticle.length,
                  itemBuilder: (context, index) {
                    return CardNewsArticle(newsArticle[index]);
                  });
            } else {
              return const Center(
                child: Text('No Data Available'),
              );
            }
          },
        );
      },
    );
  }

  Widget CardNewsArticle(ModelNewsArticle newsArticle) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ViewNewsPage(newsUrl: newsArticle.url ?? ''),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          surfaceTintColor: Colors.white,
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            child: Row(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      newsArticle.urlToImage ?? '',
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
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        );
                      },
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        newsArticle.title ?? '',
                        style:
                            ConstantTextStyle.latoBold.copyWith(fontSize: 16),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Text(
                        newsArticle.description ?? 'Description Not Available',
                        style: ConstantTextStyle.latoReg
                            .copyWith(color: Colors.black38, fontSize: 14),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
