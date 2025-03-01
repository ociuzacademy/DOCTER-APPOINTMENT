// app_modules/doctor_module/Doctor_home/widgets/grid.dart
import 'package:flutter/material.dart';

class GridMenuScreen extends StatelessWidget {
  const GridMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 columns
        mainAxisSpacing: 8.0, // Spacing between rows
        crossAxisSpacing: 8.0, // Spacing between columns
        childAspectRatio: 1.0, // Aspect ratio of each grid item
      ),
      itemCount: 6, // Total number of items in the grid
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Handle tap for each grid item
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Tapped on Item ${index + 1}')),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.widgets,
                  color: Colors.white,
                  size: 40.0,
                ),
                const SizedBox(height: 8.0),
                Text(
                  'Item ${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
