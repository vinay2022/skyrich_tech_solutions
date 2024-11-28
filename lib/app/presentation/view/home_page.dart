import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyrich_tech_solutions/app/data/provider/recipe_provider.dart';
import 'package:skyrich_tech_solutions/app/presentation/widgets/horizontalCategories.dart';
import 'package:skyrich_tech_solutions/app/presentation/widgets/offer_banner.dart';
import 'package:skyrich_tech_solutions/app/presentation/widgets/recipe_grid.dart';
import 'package:skyrich_tech_solutions/app/presentation/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    // Fetch recipe data when the page loads
    Future.microtask(() =>
        Provider.of<RecipeProvider>(context, listen: false).fetchRecipeData());
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
           const  Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              child: Row(
                children: [
                   Icon(Icons.location_on, color: Colors.red),
                  Text(
                    "Unit 10, 2F, 123 York Street",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14    ,
                        fontWeight:FontWeight.w600
                    ),
                  ),
                ],
              ),
            ),
            // Search Bar
            buildSearchBar(screenWidth),
        
            SizedBox(height: screenHeight * 0.03),
        
            // Horizontal Categories
              buildHorizontalCategories(),
            SizedBox(height: screenHeight * 0.03),
            // Offer Banner
            buildOfferBanner(),
            SizedBox(height: screenHeight * 0.03),
        
            // Recipe Grid
            buildRecipeGrid(context, screenWidth, screenHeight)
          ],
        ),
      ),
    );
  }

}


