

 import 'package:flutter/material.dart';

Widget buildSearchBar(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.redAccent),
                  SizedBox(width: 50),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
        ],
      ),
    );
  }
