import 'package:flutter/material.dart';
import 'package:mealapp/screens/categorymeal_screen.dart';
class categoryitem extends StatelessWidget {
  final String id ;
  final String title ;
  final Color color ;

   categoryitem(this.id, this.title, this.color);

    void selectcategory(BuildContext ctx) {
        Navigator.of(ctx).pushNamed(categorymealscreen.routename,
        arguments: {
          'id':id,
          'title':title,
        }
        );
    }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectcategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.titleMedium),
        decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:[
              color.withOpacity(0.6),
              color,
            ]
        ),
        borderRadius: BorderRadius.circular(15)
        ),
      ),
    );
  }
}
