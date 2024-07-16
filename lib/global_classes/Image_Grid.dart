import 'package:flutter/material.dart';

class ImgGrid extends StatelessWidget {
  final List<String> imagePaths; // List of image paths or URLs

  ImgGrid({required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of grid columns
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
      ),
      itemCount: imagePaths.length,
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: Image.asset(
            imagePaths[index], // Replace with your actual image loading logic
            fit: BoxFit.cover, // Adjust the image fit as needed
          ),
        );
      },
    );
  }
}
