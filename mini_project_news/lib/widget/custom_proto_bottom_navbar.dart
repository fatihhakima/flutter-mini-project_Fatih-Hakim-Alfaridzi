import 'package:flutter/material.dart';
import 'package:mini_project_news/provider/provider_custom_bottom_navbar.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderCustomBottomNavBar>(builder: ((context, provider, child) {
        return provider.navigationPage.elementAt(provider.currentIndex);
      })),
      bottomNavigationBar: Consumer<ProviderCustomBottomNavBar>(
        builder: (context, provider, child) {
          return SalomonBottomBar(
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
          onTap: (index) {
            provider.navigatePage(index: index);
          },
        );
        },
      ),
    );
  }
}
