import 'package:flutter/material.dart';

Widget buildOfferBanner() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.orange, Colors.red],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),

      ),
      child: const Row(
        children:  [
          Expanded(
            child: Text(
              'Get 10 off\nfor your next order now.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios_outlined, color: Colors.white),
        ],

      ),
    ),
  );
}