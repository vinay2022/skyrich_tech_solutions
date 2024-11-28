
import 'package:flutter/material.dart';

import '../view/food_category.dart';

Widget buildHorizontalCategories() {
  return const  Padding(
    padding:  EdgeInsets.symmetric(horizontal: 16.0),
    child: SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      child: Row(
        children:  [
          FoodCategory(icon: Icons.fastfood, label: 'Burger'),
          FoodCategory(icon: Icons.local_pizza, label: 'Pizza'),
          FoodCategory(icon: Icons.ramen_dining, label: 'Sushi'),
          FoodCategory(icon: Icons.set_meal, label: 'Seafood',),
          FoodCategory(icon: Icons.set_meal, label: 'Seafood', ),
          FoodCategory(icon: Icons.set_meal, label: 'Seafood', ),

        ],
      ),
    ),
  );
}