import 'package:flutter/material.dart';
import 'package:nectar_mac/config/app_images.dart';
import 'package:nectar_mac/views/Utils/constant.dart';

class SearchCard extends StatelessWidget {
  final TextEditingController _searchControl = TextEditingController();

  SearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
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
            // height: 22,
          ),
          //
          Padding(
            padding: UtilsWidget.paddingVH20,
            child: TextField(
              controller: _searchControl,
              maxLines: 1,
              // style: Theme.of(context).dropdownMenuTheme.textStyle,
              cursorHeight: 20,
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 20,
                ),
                hintText: 'Search Store',
              ),
            ),
          ),

          //
          // TextField(
          //   style: const TextStyle(
          //     fontSize: 15.0,
          //     color: Colors.black,
          //   ),
          //   decoration: InputDecoration(
          //     contentPadding: const EdgeInsets.all(10.0),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5.0),
          //       borderSide: const BorderSide(
          //         color: Colors.white,
          //       ),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderSide: const BorderSide(
          //         color: Colors.white,
          //       ),
          //       borderRadius: BorderRadius.circular(5.0),
          //     ),
          //     hintText: "Search..",
          //     prefixIcon: const Icon(
          //       Icons.search,
          //       color: Colors.black,
          //     ),
          //     suffixIcon: const Icon(
          //       Icons.filter_list,
          //       color: Colors.black,
          //     ),
          //     hintStyle: const TextStyle(
          //       fontSize: 15.0,
          //       color: Colors.black,
          //     ),
          //   ),
          //   maxLines: 1,
          //   controller: _searchControl,
          // ),
        ],
      ),
    );
  }
}
