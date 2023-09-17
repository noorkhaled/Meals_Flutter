import 'package:flutter/material.dart';
import 'package:mealapp/modules/meal.dart';
import 'package:mealapp/widgets/mealitem.dart';
class favouritescreen extends StatelessWidget {
 final List<Meal> favouritemeals;

  const favouritescreen(this.favouritemeals);
  @override
  Widget build(BuildContext context) {
    if(favouritemeals.isEmpty){
      return Center(
        child: Text("You have no favourite yet - start add meals"),
      );
    }
    else {
      return ListView.builder(
        itemBuilder:(ctx,index){
          return mealitem(
            id: favouritemeals![index].id,
            imageurl: favouritemeals![index].imageUrl,
            title: favouritemeals![index].title,
            duration: favouritemeals![index].duration,
            complexity: favouritemeals![index].complexity,
            affordability: favouritemeals![index].affordability,
          );
        } ,
        itemCount: favouritemeals?.length,
      );
    }
  }
}
