import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart'; // Ensure you have provider package
import 'package:untitled2/mode/shop.dart';
import 'package:untitled2/pages/ItemPage.dart';

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = ""; // Clears the search query
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null); // Close search delegate
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(child: Text("No results"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final products = context.watch<Shop>().shop; // Retrieve products from provider

    final filteredProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase())) // Assuming products have a 'name' property
        .toList();

    return ListView.builder(
  itemCount: filteredProducts.length,
  itemBuilder: (context, index) {
    final product = filteredProducts[index];
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(prodect: product, heroTag: "${product.id}-${product.name}"),
          ),
        );
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Hero(
              tag: '${product.id}-${product.name}', // Unique tag for animation
              child: product.imagePath.isNotEmpty
                  ? Image.asset(product.imagePath, height: 60.h, fit: BoxFit.cover)
                  : Image.asset('assets/images/fallback_image.png', height: 60.h, fit: BoxFit.cover),
            ),
            title: Text(product.name), // Ensure 'product' has a name property
            subtitle: Text("\$${product.price}"), // Ensure 'product' has a price property
          ),
        ),
      ),
    );
  },
);

  }
}
