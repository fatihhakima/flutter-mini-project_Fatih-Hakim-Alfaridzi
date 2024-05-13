import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
import 'package:mini_project_news/model/model_search_news.dart';
import 'package:mini_project_news/provider/provider_search_page.dart';
// import 'package:mini_project_news/services/service_search_news.dart';
import 'package:mini_project_news/view/view_news_page.dart';
import 'package:mini_project_news/widget/custom_bottom_navigation_bar.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 1;
  // final _searchNewsController = TextEditingController();
  // final ServiceSearchNews _searchNewsService = ServiceSearchNews();
  // late Future<List<ModelSearchNews>> _searchNewsFuture = Future.value([]);

  // void _searchNews() async {
  //   String searchText = _searchNewsController.text.trim().toLowerCase();
  //   searchText = searchText.replaceAll(' ', '-');

  //   if (searchText.isNotEmpty) {
  //     try {
  //       _searchNewsFuture = _searchNewsService.fetchSearchNews(searchText);
  //       setState(() {});
  //     } catch (e) {
  //       print('Error Searching News: $e');
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderSearchPage>(context);

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextTitle(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: provider.searchController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        hintText: 'Search Spesific News',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      provider.searchNews(provider.searchController.text);
                    },
                    icon: const Icon(Icons.manage_search_sharp),
                  ),
                ],
              ),
              _buildSearchResults(context),
            ],
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: CustomBottomNavBar(
        //     currentIndexNavigation: _currentIndex,
        //     onTap: (index) => setState(() {
        //       _currentIndex = index;
        //     }),
        //   ),
        // )
        // Positioned(
        //   left: 0,
        //   right: 0,
        //   bottom: 0,
        //   child: CustomBottomNavBar()),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndexNavigation: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }

  Widget _buildSearchResults(BuildContext context) {
    final provider = Provider.of<ProviderSearchPage>(context);

    return FutureBuilder<List<ModelSearchNews>>(
      future: provider.searchNewsResult,
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
          List<ModelSearchNews> searchNewsArticle = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: searchNewsArticle.length,
            itemBuilder: (context, index) {
              return CardSearchNews(searchNewsArticle[index]);
            },
          );
        } else {
          return const Center(
            child: Text('No Data Available'),
          );
        }
      },
    );
  }

  Widget CardSearchNews(ModelSearchNews searchNewsArticle) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ViewNewsPage(newsUrl: searchNewsArticle.url ?? ''),
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
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
                      searchNewsArticle.urlToImage ?? '',
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
                        searchNewsArticle.title ?? '',
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
                        searchNewsArticle.description ??
                            'Description Not Available',
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
