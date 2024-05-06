import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_news/constant/text_style_constant.dart';
import 'package:mini_project_news/model/custom_carousel_slider_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<CustomSliderModel> getSliders() {
  List<CustomSliderModel> slider = [];
  CustomSliderModel customSliderModel = new CustomSliderModel();

  customSliderModel.sliderImage = 'assets/business.png';
  customSliderModel.sliderName = 'This is the Business Carousel Slider Title';
  slider.add(customSliderModel);
  customSliderModel = new CustomSliderModel();

  customSliderModel.sliderImage = 'assets/entertainment.png';
  customSliderModel.sliderName =
      'This is the Entertainment Carousel Slider Title';
  slider.add(customSliderModel);
  customSliderModel = new CustomSliderModel();

  customSliderModel.sliderImage = 'assets/general.png';
  customSliderModel.sliderName = 'This is the General Carousel Slider Title';
  slider.add(customSliderModel);
  customSliderModel = new CustomSliderModel();

  customSliderModel.sliderImage = 'assets/health.png';
  customSliderModel.sliderName = 'This is the Health Carousel Slider Title';
  slider.add(customSliderModel);
  customSliderModel = new CustomSliderModel();

  customSliderModel.sliderImage = 'assets/science.png';
  customSliderModel.sliderName = 'This is the Science Carousel Slider Title';
  slider.add(customSliderModel);
  customSliderModel = new CustomSliderModel();

  customSliderModel.sliderImage = 'assets/sport.png';
  customSliderModel.sliderName = 'This is the Sport Carousel Slider Title';
  slider.add(customSliderModel);
  customSliderModel = new CustomSliderModel();

  customSliderModel.sliderImage = 'assets/technology.png';
  customSliderModel.sliderName = 'This is the Technology Carousel Slider Title';
  slider.add(customSliderModel);
  customSliderModel = new CustomSliderModel();

  return slider;
}

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  List<CustomSliderModel> sliders = [];
  int activeIndexSlider = 0;

  @override
  void initState() {
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider.builder(
        itemCount: sliders.length,
        itemBuilder: ((context, index, realIndex) {
          String? resImg = sliders[index].sliderImage;
          String? resName = sliders[index].sliderName;
          return buildSliderImage(resImg!, index, resName!);
        }),
        options: CarouselOptions(
          height: 250,
          autoPlay: true,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndexSlider = index;
            });
          },
        ),
      ),
      SizedBox(height: 14),
      buildSliderIndicator(),
    ]);
  }

  Widget buildSliderImage(String sliderImage, int index, String sliderName) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Container(
                child: Image.asset(
                  sliderImage,
                  height: 250,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 170),
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6)),
              ),
              child: Text(
                sliderName,
                style: TextStyleConstant.latoBold
                    .copyWith(color: Colors.white, fontSize: 18),
              ),
            )
          ],
        ),
      );

  Widget buildSliderIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndexSlider,
        count: sliders.length,
        effect: WormEffect(
          dotWidth: 14,
          dotHeight: 14,
          activeDotColor: Colors.blue,
        ),
      );
}
