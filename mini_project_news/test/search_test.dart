import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_news/provider/provider_custom_bottom_navbar.dart';
import 'package:mini_project_news/provider/provider_search_page.dart';
import 'package:mini_project_news/view/search_page.dart';
import 'package:mini_project_news/widget/custom_bottom_navigation_bar.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';
import 'package:provider/provider.dart';

void main() {
  group('Search Page UI Tests', () {
    testWidgets('Search Page UI Widgets Test', (WidgetTester tester) async {
      await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProviderSearchPage()),
            ChangeNotifierProvider(create: (_) => ProviderBottomNavBar()),
          ],
          child: const SearchPage(),
        ),
      ),
    );

      // Memastikan Judul pada AppBar
      expect(find.byType(CustomTextTitle), findsOneWidget);

      // Memastikan adanya TextFormField 
      expect(find.byType(TextFormField), findsOneWidget);

      // Memastikan adanya IconButton 
      expect(find.byType(IconButton), findsOneWidget);

      // Memastikan adanya CustomBottomNavBar 
      expect(find.byType(CustomBottomNavBar), findsOneWidget);
    });

    testWidgets('Search Page UI Interaction Test', (WidgetTester tester) async {
      await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => ProviderSearchPage()),
            ChangeNotifierProvider(create: (_) => ProviderBottomNavBar()),
          ],
          child: const SearchPage(),
        ),
      ),
    );
      
      // Menekan IconButton
      await tester.tap(find.byType(IconButton));

      await tester.pump();

      // Memastikan bahwa tidak terjadinya apa-apa ketika menekan IconButton (tidak ada CircularProgressIndicator)
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
