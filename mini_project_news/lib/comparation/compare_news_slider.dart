// class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
//   final ServiceNewsSlider _newsSliderService = ServiceNewsSlider();
//   late Future<List<ModelNewsSlider>> _newsSliderFuture;
//   int activeIndexSlider = 0;

//   @override
//   void initState() {
//     super.initState();
//     _newsSliderFuture = _newsSliderService.fetchNewsSlider();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<ModelNewsSlider>>(
//       future: _newsSliderFuture,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           List<ModelNewsSlider> sliders = snapshot.data ?? [];
//           return Column(children: [
//             CarouselSlider.builder(
//               itemCount: sliders.length,
//               itemBuilder: ((context, index, realIndex) {
//                 String? resImg = sliders[index].urlToImage;
//                 String? resName = sliders[index].title;
//                 return buildSliderImage(resImg!, index, resName!);
//               }),
//               options: CarouselOptions(
//                 height: 250,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 enlargeStrategy: CenterPageEnlargeStrategy.height,
//                 onPageChanged: (index, reason) {
//                   setState(() {
//                     activeIndexSlider = index;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(height: 14),
//             buildSliderIndicator(sliders.length),
//           ]);
//         }
//       },
//     );
//   }

//   Widget buildSliderImage(String sliderImage, int index, String sliderName) =>
//       Container(
//         margin: EdgeInsets.symmetric(horizontal: 4),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(6),
//               child: Container(
//                 child: Image.network(
//                   sliderImage,
//                   height: 250,
//                   fit: BoxFit.cover,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 170),
//               padding: EdgeInsets.symmetric(horizontal: 10),
//               height: 250,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.black38,
//                 borderRadius: BorderRadius.only(bottomLeft: Radius.circular(6)),
//               ),
//               child: Text(
//                 sliderName,
//                 style: ConstantTextStyle.latoBold
//                     .copyWith(color: Colors.white, fontSize: 18),
//               ),
//             )
//           ],
//         ),
//       );

//   Widget buildSliderIndicator(int itemCount) => AnimatedSmoothIndicator(
//         activeIndex: activeIndexSlider,
//         count: itemCount,
//         effect: WormEffect(
//           dotWidth: 14,
//           dotHeight: 14,
//           activeDotColor: Colors.blue,
//         ),
//       );
// }
