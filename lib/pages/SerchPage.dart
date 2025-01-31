import 'package:flutter/material.dart';
import 'package:untitled2/pagecombs/serch.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearch());
            },
          )
        ],
      ),
      body: const Center(
        child: Text("Tap the search icon to search"),
      ),
    );
  }
}
