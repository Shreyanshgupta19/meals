import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key,required this.category, required this.onSelectCategory});

  final Category category;
  final void Function(BuildContext, Category) onSelectCategory;  // or final void Function(BuildContext context, Category) onSelectCategory; // or final void Function() onSelectCategory;   // it is a pointer it's points to the _selectCategory

  @override
  Widget build(context) {
    return InkWell(
      onTap: (){ onSelectCategory(context, category); },  // or   onSelectCategory,
      splashColor: Theme.of(context).primaryColor,  // on tap color
      borderRadius: BorderRadius.circular(16),     // tappable area border radius which shown when we tap on the button
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),  // container area border radius
          gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
        color: Theme.of(context).colorScheme.onBackground,
        ),
        ),
      ),
    );
  }
}

