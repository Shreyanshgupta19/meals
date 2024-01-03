import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';


const kInitialFilters = {   // or Map<Filter, bool> kInitialFilters = {  key:value
  Filter.gultenFree: false,  // in map we don't assign values by '=' we assign only by using ':'
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};


class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key,});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}
class _TabsScreenState extends State<TabsScreen>{
  int _selectedPageIndex = 0;  // initially in default, currentIndex = 0
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> _selectedFilters = kInitialFilters;          // or static const _selectedFilters = kInitialFilters; // here _selectedFilters is local variable and kInitialFilters is global variable here we use local variable which is copy of global variable so if we do any change it change only locally not globally

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(message),
    ),
    );
  }

  void _toggleMealFavoritesStatus(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite.');
    }
    else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showInfoMessage('Marked as a favorite!');
    }
  }

  void _onTapselectPageIndex(int index){  // here index = selected index of items
    setState(() {
      _selectedPageIndex = index;  // it used to make clickable BottomNavigationBar
    });
  }

  void _setScreen(String identifier) async{
    Navigator.of(context).pop();
    if(identifier == 'filters'){  // pushReplacement is replace first screen of stack to second screen so therefore the back button wouldn't work because there is nowhere to go back to and second screen doesn't show default back button
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => FiltersScreen() ) );
     final result = await Navigator.of(context).push<Map<Filter, bool>>(MaterialPageRoute(builder: (ctx) => FiltersScreen(currentFilters: _selectedFilters,) ) );    // Type of result : Map<Filter, bool>?  // here ? says that result variable is initially is null

  // print(result);
      setState(
              () {
        _selectedFilters = result ?? kInitialFilters;
           }
        );
    }
  }

  @override
  Widget build(BuildContext context){

    final availableMeals = dummyMeals.where(
            (meal) {
      if(_selectedFilters[Filter.gultenFree]! && !meal.isGlutenFree){  // _selectedFilters[Filter.gultenFree]! = is not null,    !meal.isGlutenFree = is not true or exclude meals are not GlutenFree
        return false;  // if selected filter is gulten free and meal(dummymeal) is not gulten free then we return false that means we don't included this meal which has not satisfy both condition
      }
      if(_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree){
        return false;
      }
      if(_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian){
        return false;
      }
      if(_selectedFilters[Filter.vegan]! && !meal.isVegan){
        return false;
      }
      return true;   // if it satisfy all condition then we include this meal to a list form
          }
       ).toList();


    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoritesStatus, availableMeals: availableMeals,);  // default screen at _selectedPageIndex == 0
    var activePageTitle = 'Categories';    // default title at _selectedPageIndex == 0

    Widget favourite = Text(_favoriteMeals.length.toString(),
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Theme.of(context).cardColor,
        fontWeight: FontWeight.bold,
        fontSize: 10,
      ),
    );

    if(_selectedPageIndex == 1){
      activePage = MealsScreen(meals: _favoriteMeals, onToggleFavorite: _toggleMealFavoritesStatus,);

      activePageTitle = 'Your Favorites';

      favourite = Text(_favoriteMeals.length.toString(),
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 10,
          ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectScreen: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,  // currentIndex of items
        onTap: _onTapselectPageIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories',),  // items at index 0
          BottomNavigationBarItem(                     // items at index 1
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,size: 18,),
                      // Positioned(
                       // bottom: 20,
                        // child:
                        favourite,
                         // ),
                        ],
                ),

            //  or
            // icon: Stack(
            //   children: [
            //     Container(
            //       width: double.maxFinite,
            //       child: Icon(Icons.favorite),
            //     ),
            //     Positioned(
            //       left: 115,
            //       bottom: 8,
            //       child: favourite,
            //     ),
            //   ],
            //
            // ),

            label: 'Favorites',),      // items at index 1
        ],
      ),
    );
  }
}
