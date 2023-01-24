import 'package:flutter/material.dart';

import '../../../data/Models/lines_in_card.dart';
import 'Components/my_cart_icon.dart';
import 'Pages/cart/my_cart.dart';
import 'Pages/explorer/explorer_tab.dart';
import 'Pages/favorite/favorite_tab.dart';
import 'Pages/shop/shop_tab.dart';
import 'model/page_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static List<LinesInCard?> myCart = [];

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
        widget: const ExplorerTab(searchWord: "Egg"),
        icon: const Icon(
          Icons.search_outlined,
        ),
        label: "Explore",
      ),
      PageTab(
        widget: MyCart(),
        icon: MyCartIcon(
          count: myCart.length,
        ),
        label: "Cart",
      ),
      PageTab(
        widget: const FavoriteTab(),
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
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.green,
          //     spreadRadius: 0,
          //     offset: Offset(0, 3),
          //   ),
          // ],
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
          // selectedIconTheme:
          //     Theme.of(context).bottomNavigationBarTheme.selectedIconTheme,
          // unselectedIconTheme:
          //     Theme.of(context).bottomNavigationBarTheme.unselectedIconTheme,
          // unselectedItemColor:
          //     Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          // selectedItemColor:
          //     Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          // selectedLabelStyle:
          //     Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
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
