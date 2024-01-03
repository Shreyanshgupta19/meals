import 'package:flutter/material.dart';

enum Filter {
  gultenFree,
  lactoseFree,
  vegetarian,
  vegan,
}


class FiltersScreen extends StatefulWidget{
  const FiltersScreen ({super.key, required this.currentFilters, });

  final Map<Filter, bool> currentFilters;   // <Filter, bool> = <enum Filter class , true/false>

  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    super.initState(); // here, we use the initState method to access the properties and methods of the widget class, like current filters // this initState method is override those initial values here like gultenFreeFilterSet with the values i got here in my widget So with the current filters
    _glutenFreeFilterSet = widget.currentFilters[Filter.gultenFree]!;  // this ! tells dart that this will not be null which we know it won't because this is a required parameter here we don't need to call setState because initState will run before the build method executes anyways
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.vegan]!;

  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters!'),
      ),

      // drawer: MainDrawer(
      //   onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals') {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen() ));
      //   }
      // },
      // ),

      body: WillPopScope(
        onWillPop: () async{          // onWillPop wants a function which returns future which eventually yields a boolean
          Navigator.of(context).pop(  // instead of getting a boolean right away and therefore to make sure that this is the case we should add the 'async' keyword here
              { // map
            Filter.gultenFree : _glutenFreeFilterSet,  //  Filter.gultenFree : false,
            Filter.lactoseFree : _lactoseFreeFilterSet,
            Filter.vegetarian : _vegetarianFilterSet,
            Filter.vegan : _veganFilterSet,
          }
          );
          return false;  // in this function here, we have to return true or false to in the end confirm whether we want to navigate back or not. And since we are navigating back manually here, we  should indeed return false so that we are not popping twice. if you would not be popping manually here but doing anything else, like saving data to some database it would make sense to return true instead if  you wanted to allow the user to leave the screen here we will return false
        },
        child: Column(
          children: [
            SwitchListTile(   // on/off button
              value: _glutenFreeFilterSet,  // here, value: accepts a bool value  // here, _glutenFreeFilterSet is a bool and containing _FiltersScreenState class
              onChanged: (isChecked){  // here, isChecked is bool  // onChanged, accepts a void Function(bool)? onChanged  //  initially the value of _glutenFreeFilterSet is false when we clicked onChanged and the value of isChecked is opposite of value of _glutenFreeFilterSet  and in this function we changed the value of _glutenFreeFilterSet
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
              },
              title: Text('Gluten-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
              ),
              subtitle: Text('Only include gluten-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22,),
            ),


            SwitchListTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked){  // here, isChecked is bool
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
              },
              title: Text('Lactose-free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
              ),
              subtitle: Text('Only include Lactose-free meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22,),
            ),


            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked){  // here, isChecked is bool
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
              },
              title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
              ),
              subtitle: Text('Only include vegetarian meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22,),
            ),


            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){  // here, isChecked is bool
                setState(() {
                  _veganFilterSet = isChecked;
                });
              },
              title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onError,
              ),
              ),
              subtitle: Text('Only include vegan meals.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onError,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22,),
            ),
          ],
        ),
      ),
    );
  }
}