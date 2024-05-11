import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/constant_text_style.dart';
import 'package:mini_project_news/model/model_news_slider.dart';
import 'package:mini_project_news/services/service_news_slider.dart';
import 'package:mini_project_news/view/view_news_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final ServiceNewsSlider _newsSliderService = ServiceNewsSlider();
  late Future<List<ModelNewsSlider>> _newsSliderFuture;
  int activeIndexSlider = 0;

  @override
  void initState() {
    super.initState();
    _newsSliderFuture = _newsSliderService.fetchNewsSlider();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelNewsSlider>>(
        future: _newsSliderFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<ModelNewsSlider> sliders = snapshot.data ?? [];
            return Column(children: [
              CarouselSlider.builder(
                itemCount: 5, //sliders.length
                itemBuilder: ((context, index, realIndex) {
                  String? resImg = sliders[index].urlToImage;
                  String? resName = sliders[index].title;
                  return buildSliderImage(resImg!, index, resName!, sliders);
                }),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction:
                      1, // untuk mengubah jumlah gambar yang ditampilkan pada slider
                  // enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndexSlider = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 14),
              buildSliderIndicator(sliders.length),
            ]);
          }
        });
  }

  Widget buildSliderImage(String sliderImage, int index, String sliderName,
          List<ModelNewsSlider> sliders) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ViewNewsPage(newsUrl: sliders[index].url ?? ''),
              ));
        },
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 4),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Container(
                  child: sliderImage.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: sliderImage,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          height: 300, //300
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        )
                      : Image.asset('assets/image_error_placeholder.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 220),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 300, //300
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(0)),
                ),
                child: Text(
                  sliderName,
                  maxLines: 2,
                  style: ConstantTextStyle.latoBold
                      .copyWith(color: Colors.white, fontSize: 18),
                ),
              )
            ],
          ),
        ),
      );

  Widget buildSliderIndicator(int itemCount) => AnimatedSmoothIndicator(
        activeIndex: activeIndexSlider,
        count: 5, //itemCount
        effect: const WormEffect(
          dotWidth: 10,
          dotHeight: 10,
          activeDotColor: Colors.blue,
        ),
      );
}
