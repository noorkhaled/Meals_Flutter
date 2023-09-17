import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/category_item.dart';
class categoryscreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((catdata) =>
          categoryitem(catdata.id, catdata.title, catdata.color)
        ).toList(),
      ),
    );
  }
}
