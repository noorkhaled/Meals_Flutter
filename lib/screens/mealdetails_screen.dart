import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
class mealdetailedscreen extends StatelessWidget {
final Function togglefav;
final Function ismealfav;
  static const routename = 'mealdetails';

  const mealdetailedscreen( this.togglefav, this.ismealfav);
Widget buildsectiontitle(BuildContext ctx,String txt){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(txt,style: Theme.of(ctx).textTheme.titleMedium,),
  );
}
Widget buildsectionbody(Widget child){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(15)
    ),
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(10),
    height: 150,
    width: 300,
    child:child
  );
}

  @override
  Widget build(BuildContext context) {
final mealid  = ModalRoute.of(context)?.settings.arguments as String;
final selectedmeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealid);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedmeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              child: Image.network(selectedmeal.imageUrl,fit: BoxFit.cover,),
            ),
            buildsectiontitle(context,"Ingredients"),
           buildsectionbody(
             ListView.builder(
               itemBuilder: (ctx,index) => Card(
                 color: Theme.of(context).accentColor,
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(selectedmeal.ingredients[index]),
                 ),
               ),
               itemCount: selectedmeal.ingredients.length,
             ),
           ),
            buildsectiontitle(context, "Steps"),
            buildsectionbody(
              ListView.builder(
                itemBuilder: (ctx,index) => Column(
                  children: [
                    ListTile(
                      title: Text(selectedmeal.steps[index]),
                      leading: CircleAvatar(
                          child: Text("#${index+1}")
                      ),
                    ),
                    Divider(),
                  ],
                ),
                itemCount: selectedmeal.steps.length,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          ismealfav(mealid) ? Icons.star : Icons.star_border
        ),
        onPressed: ()=>togglefav(mealid),
      ),
    );
  }
}
