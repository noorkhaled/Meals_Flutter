import 'package:flutter/material.dart';
import 'package:mealapp/widgets/maindrawer.dart';
class filterscreen extends StatefulWidget {
  static const routename = 'filter_screen';
  final  Function savefilters;
  final Map<String,bool> filters;

  const filterscreen(this.savefilters, this.filters);

  @override
  State<filterscreen> createState() => _filterscreenState();
}

class _filterscreenState extends State<filterscreen> {

   bool GlutenFree = false;
   bool LactoseFree = false;
   bool Vegan = false;
   bool Vegetarian = false;

   Widget buildswitchlisttile(String title,bool value,String subtitle,Function updatevalue){
     return SwitchListTile(
       title: Text(title),
       value: value,
       onChanged:(newval) => updatevalue(newval),
       subtitle: Text(subtitle),
     );
   }

    @override
    void initState() {
       GlutenFree = widget.filters['Gluten']!;
       LactoseFree = widget.filters['Lactose']!;
       Vegan = widget.filters['Vegan']!;
       Vegetarian = widget.filters['Vegetarian']!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed: (){
                final myfilters = {
                  'Gluten':GlutenFree,
                  'Lactose':LactoseFree,
                  'Vegan':Vegan,
                  'Vegetarian':Vegetarian,
                };
                widget.savefilters(myfilters);
              },
              icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal selection",style: Theme.of(context).textTheme.titleMedium,),
          ),
          Expanded(
              child: ListView(
                children: [
                  buildswitchlisttile(
                      "Gluten-Free",
                      GlutenFree,
                      "Only Include Gluten-Free meals",
                          (value) {
                           setState((){
                      GlutenFree=value;
                    });
                  }),
                  buildswitchlisttile(
                      "Lactose-Free",
                      LactoseFree,
                      "Only Include Lactose-Free meals",
                          (value) {
                           setState((){
                      LactoseFree=value;
                    });
                  }),
                  buildswitchlisttile(
                      "Vegan",
                      Vegan,
                      "Only Include Vegan meals",
                          (value) {
                           setState((){
                      Vegan=value;
                    });
                  }),
                  buildswitchlisttile(
                      "Vegetarian",
                      Vegetarian,
                      "Only Include vegetarian meals",
                          (value) {
                           setState((){
                      Vegetarian=value;
                    });
                  }),
                ],
              )
          )
        ],
      ),
      drawer: maindrawer(),
    );
  }
}
