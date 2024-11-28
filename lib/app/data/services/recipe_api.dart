import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skyrich_tech_solutions/app/data/model/RecipeModel.dart';

class RecipeApi {
  final baseUrl = 'https://dummyjson.com/recipes';

  Future<RecipeModel?> fetchRecipeData() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return RecipeModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to fetch recipes');
      }
    } catch (e) {
      print("API Error: $e");
      return null;
    }
  }
}
