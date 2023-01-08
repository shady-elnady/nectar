import 'package:flutter/material.dart';

import 'Pages/index.dart';
import 'Pages/shop_page.dart';
import 'model/page_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;
  final List<PageTab> _pages = [
    PageTab(
      widget: const ShopTab(),
      icon: const Icon(
        Icons.call,
      ),
      label: "Shop",
    ),
    PageTab(
      widget: const ShopTabWidget(),
      icon: const Icon(
        Icons.camera,
      ),
      label: "Explore",
    ),
    PageTab(
      widget: const ShopPage(),
      icon: const Icon(
        Icons.chat,
      ),
      label: "Cart",
    ),
    PageTab(
      widget: const Icon(
        Icons.camera,
        size: 150,
        color: Colors.red,
      ),
      icon: const Icon(
        Icons.camera,
      ),
      label: "Favourite",
    ),
    PageTab(
      widget: const Icon(
        Icons.chat,
        size: 150,
        color: Colors.red,
      ),
      icon: const Icon(
        Icons.chat,
      ),
      label: "Account",
    ),
  ];
  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: _pages.elementAt(_selectedIndex).widget,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          type: Theme.of(context).bottomNavigationBarTheme.type,
          elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
          iconSize: 20,
          selectedFontSize: 20,
          selectedIconTheme:
              Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
          unselectedIconTheme:
              Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          selectedLabelStyle:
              Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
          items: <BottomNavigationBarItem>[
            ..._pages
                .map(
                  (PageTab page) => BottomNavigationBarItem(
                    icon: page.icon,
                    label: page.label,
                  ),
                )
                .toList(),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
