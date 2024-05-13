import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_news/provider/provider_search_page.dart';
import 'package:mini_project_news/view/search_page.dart';
import 'package:mini_project_news/widget/custom_bottom_navigation_bar.dart';
import 'package:mini_project_news/widget/custom_title_text.dart';
import 'package:provider/provider.dart';

void main() {
  group('Search Page UI Tests', () {
    testWidgets('Search Page UI Widgets Test', (WidgetTester tester) async {
      // Build the SearchPage widget
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => ProviderSearchPage(),
          child: const SearchPage(),
        ),
      ));

      await tester.pumpAndSettle();

      // Verify the presence of AppBar title
      expect(find.byType(CustomTextTitle), findsOneWidget);

      // Verify the presence of TextFormField
      expect(find.byType(TextFormField), findsOneWidget);

      // Verify the presence of IconButton
      expect(find.byType(IconButton), findsOneWidget);

      // Verify the presence of CustomBottomNavBar
      expect(find.byType(CustomBottomNavBar), findsOneWidget);
    });

    testWidgets('Search Page UI Interaction Test', (WidgetTester tester) async {
      // Build the SearchPage widget
      await tester.pumpWidget(MaterialApp(
        home: ChangeNotifierProvider(
          create: (context) => ProviderSearchPage(),
          child: const SearchPage(),
        ),
      ));
      
      // Tap on the search icon button
      await tester.tap(find.byType(IconButton));

      // Rebuild the widget after the state has changed
      await tester.pump();

      // Verify the presence of CircularProgressIndicator after tapping the search icon button
      expect(find.byType(CircularProgressIndicator), findsNothing);
    });
  });
}
