import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/provider/recipe_provider.dart';

Widget buildRecipeGrid(BuildContext context, double screenWidth, double screenHeight) {
  return Consumer<RecipeProvider>(
    builder: (context, provider, _) {
      if (provider.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }
      if (provider.recipe == null || provider.recipe!.isEmpty) {
        return const Center(child: Text('No Data Found'));
      }
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),

          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 4 / 6,
          ),
          itemCount: provider.recipe!.length,
          itemBuilder: (context, index) {
            final recipe = provider.recipe![index];
            return SizedBox(
              height: screenHeight * 2,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Recipe Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: recipe.image != null
                          ? Image.network(
                        recipe.image!,
                        height: screenHeight * 0.15,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                          : Container(
                        height: screenHeight * 0.15,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.fastfood,
                          size: 50,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Recipe Details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        recipe.name ?? 'Unnamed Recipe',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Cuisine: ${recipe.cuisine ?? 'Unknown'}',
                        style: const TextStyle(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Difficulty: ${recipe.difficulty?.toString().split('.').last ?? 'Unknown'}',
                        style: const TextStyle(fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(),

                    // Recipe Rating
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          Text('${recipe.rating ?? 0.0} ⭐'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}