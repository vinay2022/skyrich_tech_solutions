import 'package:flutter/material.dart';

class FoodCategory extends StatelessWidget {
  final IconData icon;
  final String label;

  const FoodCategory({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[200],
            child: Icon(icon, size: 50, color: Colors.orange),
          ),
          SizedBox(height: screenWidth * 0.02),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}