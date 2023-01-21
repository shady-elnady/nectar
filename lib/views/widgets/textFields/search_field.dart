import 'package:flutter/material.dart';

import '../../Utils/constant.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required TextEditingController searchControl,
  }) : _searchControl = searchControl;

  final TextEditingController _searchControl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UtilsWidget.edgeInsetsV20,
      child: TextField(
        style: TextStyle(
          fontSize: 14,
          color: Theme.of(context).primaryColorDark,
        ),
        controller: _searchControl,
        maxLines: 1,
        cursorHeight: 20,
        decoration: InputDecoration(
          filled: true, //<-- SEE HERE
          fillColor: Theme.of(context).hintColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: Theme.of(context).primaryColorDark,
          ),
          suffixIcon: Icon(
            Icons.close_rounded,
            size: 10,
            color: Theme.of(context).primaryColorLight,
          ),
          hintText: 'Search Store',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
