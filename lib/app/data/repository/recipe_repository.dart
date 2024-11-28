import '../model/RecipeModel.dart';
import '../services/recipe_api.dart';

class RecipeRepository {

  final RecipeApi _recipeApi = RecipeApi();

  Future<RecipeModel?> fetchRecipeData() => _recipeApi.fetchRecipeData();

}