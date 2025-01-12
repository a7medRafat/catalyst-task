import 'package:flutter/material.dart';

class PropertyImg extends StatelessWidget {
  const PropertyImg({super.key, required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        img,
        fit: BoxFit.cover,
        errorBuilder: (context, exception, stackTrace) {
          return const Icon(Icons.error_outline);
        },
      ),
    );
  }
}
