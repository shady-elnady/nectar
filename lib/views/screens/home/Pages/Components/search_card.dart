import 'package:flutter/material.dart';
import 'package:nectar_mac/config/app_images.dart';

import '../../../../widgets/textFields/search_field.dart';

class SearchCard extends StatelessWidget {
  final TextEditingController _searchControl = TextEditingController();

  SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: Column(
        children: [
          //
          Image.asset(
            AppImages.carot,
            width: 27,
          ),
          Image.asset(
            AppImages.dhaka,
            width: size.width / 2.4,
          ),
          // Search TextField
          SearchField(searchControl: _searchControl),
        ],
      ),
    );
  }
}
