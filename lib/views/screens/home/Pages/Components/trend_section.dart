import 'package:flutter/material.dart';

import 'search_card.dart';
import 'trend_item.dart';

class TrendSection extends StatelessWidget {
  const TrendSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("Trending Restaurants"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 0,
          horizontal: 10.0,
        ),
        child: ListView(
          children: <Widget>[
            SearchCard(),
            const SizedBox(height: 10.0),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              // ignore: unnecessary_null_comparison
              itemCount: departmentsList == null ? 0 : departmentsList.length,
              itemBuilder: (BuildContext context, int index) {
                Map restaurant = departmentsList[index];

                return TrendItem(
                  img: restaurant["img"],
                  title: restaurant["title"],
                  address: restaurant["address"],
                  rating: restaurant["rating"],
                );
              },
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
