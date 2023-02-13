import 'package:flutter/material.dart';

import '../widgets/icons/my_cart_icon.dart';
import '../../Modules/Department/presentation/Pages/shop_tab.dart';
import 'model/page_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<LineInMyCar?> myBasket = [];

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
    final List<PageTab> pages = [
      PageTab(
        widget: const ShopTab(),
        icon: const Icon(
          Icons.call,
        ),
        label: "Shop",
      ),
      PageTab(
        // widget: const ExplorerTab(searchWord: "Egg"),
        widget: const Icon(Icons.search_outlined),
        icon: const Icon(
          Icons.search_outlined,
        ),
        label: "Explore",
      ),
      PageTab(
        // widget: MyCartTab(),
        widget: const Icon(Icons.search_outlined),
        icon: MyCartIcon(
          count: myCart.length,
        ),
        label: "Cart",
      ),
      PageTab(
        // widget: const FavoriteTab(),
        widget: const Icon(Icons.search_outlined),
        icon: const Icon(
          Icons.favorite_border_outlined,
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
          Icons.account_balance_outlined,
        ),
        label: "Account",
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: pages.elementAt(_selectedIndex).widget,
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).primaryColorLight.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: BottomNavigationBar(
          type: Theme.of(context).bottomNavigationBarTheme.type,
          elevation: 0,
          iconSize: 20,
          selectedFontSize: 20,
          items: <BottomNavigationBarItem>[
            ...pages
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
