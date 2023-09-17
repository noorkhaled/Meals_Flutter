import 'package:flutter/material.dart';
import 'package:mealapp/modules/meal.dart';
import 'package:mealapp/widgets/mealitem.dart';
class categorymealscreen extends StatefulWidget {
static const routename = 'category_meals';
final List<Meal> availablemeal;

  const categorymealscreen(this.availablemeal);
  @override
  State<categorymealscreen> createState() => _categorymealState();
}

class _categorymealState extends State<categorymealscreen> {
String? cat_title;
List<Meal>? categorymeals;
@override
  void didChangeDependencies() {
  final routearg  = ModalRoute.of(context)?.settings.arguments as Map<String,String>;
  final cat_id = routearg['id'];
  cat_title =routearg['title']!;
  categorymeals = widget.availablemeal.where((meal) {
    return meal.categories.contains(cat_id);
  }).toList();
    super.didChangeDependencies();
  }

  void removemeal(String mealId){
    setState(() {
          categorymeals!.removeWhere((removedmeal) => removedmeal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('$cat_title')),
      body: ListView.builder(
          itemBuilder:(ctx,index){
            return mealitem(
              id: categorymeals![index].id,
              imageurl: categorymeals![index].imageUrl,
              title: categorymeals![index].title,
              duration: categorymeals![index].duration,
              complexity: categorymeals![index].complexity,
              affordability: categorymeals![index].affordability,
            );
          } ,
        itemCount: categorymeals?.length,
      ),
    );
  }
}
