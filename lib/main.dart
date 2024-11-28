import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skyrich_tech_solutions/app/data/provider/recipe_provider.dart';

import 'app/presentation/view/home_page.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const HomePage(),
    );
  }
}

// class FoodHomePage extends StatefulWidget {
//   @override
//   _FoodHomePageState createState() => _FoodHomePageState();
// }
//
// class _FoodHomePageState extends State<FoodHomePage> {
//   List<dynamic> foodItems = []; // Store API response data
//   bool isLoading = true; // Show a loader until data is fetched
//
//   @override
//   void initState() {
//     super.initState();
//     fetchFoodItems();
//   }
//
//   // Fetch data from API
//   Future<void> fetchFoodItems() async {
//     final url = 'https://dummyjson.com/recipes'; // Replace with a food API
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         setState(() {
//           foodItems = json.decode(response.body).take(10).toList(); // Take 10 items
//           isLoading = false;
//         });
//       } else {
//         throw Exception('Failed to load food items');
//       }
//     } catch (e) {
//       print(e);
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           'Unit 10, 2F, 123 York Street',
//           style: TextStyle(color: Colors.black, fontSize: 16),
//         ),
//         centerTitle: true,
//         leading: Icon(Icons.location_on, color: Colors.red),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Bar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: 'Search',
//                         prefixIcon: Icon(Icons.search),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         fillColor: Colors.grey[200],
//                         filled: true,
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Icon(Icons.filter_alt, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Horizontal Categories
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     FoodCategory(icon: Icons.fastfood, label: 'Burger'),
//                     FoodCategory(icon: Icons.local_pizza, label: 'Pizza'),
//                     FoodCategory(icon: Icons.ramen_dining, label: 'Sushi'),
//                     FoodCategory(icon: Icons.icecream, label: 'Dessert'),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Offer Banner
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Colors.orange[100],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Text(
//                         'Get 10 off\nfor your next order now.',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     Icon(Icons.arrow_forward, color: Colors.red),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Food List
//             isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 children: foodItems.map((item) {
//                   return FoodCard(
//                     imageUrl: item['url'], // Dynamic image URL
//                     name: item['title'], // Dynamic name
//                     rating: '4.5', // Static rating
//                     time: '20-30 min', // Static time
//                   );
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class FoodCategory extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   FoodCategory({required this.icon, required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.grey[200],
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, size: 30, color: Colors.red),
//           ),
//           SizedBox(height: 5),
//           Text(label, style: TextStyle(fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }
//
// class FoodCard extends StatelessWidget {
//   final String imageUrl;
//   final String name;
//   final String rating;
//   final String time;
//
//   FoodCard({
//     required this.imageUrl,
//     required this.name,
//     required this.rating,
//     required this.time,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 16),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.network(
//               imageUrl,
//               width: 80,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 5),
//                 Text('Cafe • Western Food'),
//                 SizedBox(height: 5),
//                 Row(
//                   children: [
//                     Icon(Icons.star, color: Colors.orange, size: 16),
//                     SizedBox(width: 5),
//                     Text(rating),
//                     SizedBox(width: 10),
//                     Text(time, style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
