import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:mini_project_news/provider/provider_chat_ai_page.dart';
import 'package:mini_project_news/provider/provider_custom_bottom_navbar.dart';
import 'package:mini_project_news/provider/provider_home_page.dart';
import 'package:mini_project_news/provider/provider_search_page.dart';
import 'package:mini_project_news/provider/provider_view_all_news_page.dart';
import 'package:mini_project_news/provider/provider_view_category_page.dart';
import 'package:mini_project_news/view/splash_page.dart';
import 'package:mini_project_news/env/env.dart';
import 'package:provider/provider.dart';

void main() {
  // HttpOverrides.global = new MyHttpOverrides();
  Gemini.init(apiKey: Env.geminiApiKey);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderBottomNavBar()),
        ChangeNotifierProvider(create: (context) => ProviderHomePage()),
        ChangeNotifierProvider(create: (context) => ProviderViewCategory()),
        ChangeNotifierProvider(create: (context) => ProviderViewAllNews()),
        ChangeNotifierProvider(create: (context) => ProviderSearchPage()),
        ChangeNotifierProvider(create: (context) => ProviderChatAI()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: SplashScreen(),
    );
  }
}

//  class MyHttpOverrides extends HttpOverrides{
//   @override
//   HttpClient createHttpClient(SecurityContext? context){
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//   }
// }