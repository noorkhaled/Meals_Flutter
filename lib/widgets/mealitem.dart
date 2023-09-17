import 'package:flutter/material.dart';
import 'package:mealapp/modules/meal.dart';
import 'package:mealapp/screens/mealdetails_screen.dart';
class mealitem extends StatelessWidget {
  const mealitem({
    required this.imageurl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.id,
  });

  final String id;
  final String imageurl;
  final String title ;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  String get Complexitytext{
      switch(complexity){
        case Complexity.Simple:return 'simple'; break;
        case Complexity.Challenging:return 'challenging'; break;
        case Complexity.Hard:return 'hard'; break;
        default :return 'unknown'; break;
      }
    }

  String get Affordabilitytext{
    switch(affordability){
      case Affordability.Affordable:return 'Affordable'; break;
      case Affordability.Pricey:return 'Pricey'; break;
      case Affordability.Luxurious:return 'Luxurious'; break;
      default :return 'unknown'; break;
    }
  }


  void selectmeal(BuildContext ctx){
      Navigator.of(ctx).pushNamed(
        mealdetailedscreen.routename,
        arguments:id
      ).then((result) {
          //if(result != null) removeitem(result);
      }
      );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Image.network(imageurl,height: 200,width: double.infinity,fit: BoxFit.cover,),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                        width: 280,
                        color: Colors.black54,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 25,color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade
                        ),
                      ),
                    ),
              ],
            ),
            Padding
              (
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Row(
                   children: [
                     Icon(Icons.schedule),
                     SizedBox(width: 2),
                     Text("$duration min")
                   ],
                 ),
                 Row(
                   children: [
                     Icon(Icons.work),
                     SizedBox(width: 2),
                     Text("$Complexitytext")
                   ],
                 ),
                 Row(
                   children: [
                     Icon(Icons.attach_money),
                     SizedBox(width: 2),
                     Text("$Affordabilitytext")
                   ],
                 ),
               ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
