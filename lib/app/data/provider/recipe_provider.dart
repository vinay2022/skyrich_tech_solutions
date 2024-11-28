import 'package:flutter/material.dart';
import 'package:skyrich_tech_solutions/app/data/model/RecipeModel.dart';

import '../services/recipe_api.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe>? _recipe;
  bool _isLoading = false;

  List<Recipe>? get recipe => _recipe;
  bool get isLoading => _isLoading;

  Future<void> fetchRecipeData() async {
    _isLoading = true;
    notifyListeners();
    try {
      final data = await RecipeApi().fetchRecipeData();
      _recipe = data?.recipes ?? [];
    } catch (e) {
      print("Error fetching recipes: $e");
      _recipe = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
