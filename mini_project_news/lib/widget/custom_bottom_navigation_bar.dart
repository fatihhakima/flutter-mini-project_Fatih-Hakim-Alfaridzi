import 'package:flutter/material.dart';
import 'package:mini_project_news/provider/provider_custom_bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final providerBottomNavBar = Provider.of<ProviderBottomNavBar>(context);

    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(16),
      surfaceTintColor: Colors.white,
      // color: Colors.white,
      child: SalomonBottomBar(
        duration: const Duration(seconds: 1),
        items: [
          SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              selectedColor: Colors.blue),
          SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text('Search'),
              selectedColor: Colors.blue),
          SalomonBottomBarItem(
              icon: const Icon(Icons.android),
              title: const Text('AI'),
              selectedColor: Colors.blue),
        ],
        currentIndex: providerBottomNavBar.currentIndex,
        onTap: (index) => providerBottomNavBar.navigateToPage(context, index),
      ),
    );
  }
}
