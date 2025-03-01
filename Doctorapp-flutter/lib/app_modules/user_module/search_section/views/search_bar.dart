// app_modules/search_section/views/search_bar.dart
import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 5),
            Text("Poothole"),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: const [
          Icon(Icons.notifications),
          Icon(Icons.more_vert),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Symptoms / Specialities',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Continue searching for...',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const SearchItem(title: 'Typhoid Fever Treatment', type: 'Service'),
            const SearchItem(title: 'Fever Treatment', type: 'Service'),
            const SearchItem(title: 'Dentist', type: 'Speciality'),
          ],
        ),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  final String title;
  final String type;

  const SearchItem({super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: const Icon(Icons.history),
        title: Text(title),
        subtitle: Text(type),
        trailing: const Icon(Icons.close),
      ),
    );
  }
}
