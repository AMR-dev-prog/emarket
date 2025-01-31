import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/mode/prodect.dart';
import 'package:untitled2/mode/shop.dart';
import 'package:untitled2/pages/ItemPage.dart';

class ItemTile extends StatelessWidget {
  final Prodect prodect;
  const ItemTile({super.key, required this.prodect});

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Add to Cart"),
        content: const Text("Add this item to your cart?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              context.read<Shop>().addToCart(prodect, prodect.quantity);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(prodect: prodect),
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: '${prodect.id}-${prodect.name}', // Unique tag for each item
                child: prodect.imagePath.isNotEmpty
                    ? Image.asset(prodect.imagePath, height: 60, fit: BoxFit.cover)
                    : Image.asset('assets/images/fallback_image.png', height: 60, fit: BoxFit.cover),
              ),
              const SizedBox(height: 8),
              Text(
                prodect.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    '\$${prodect.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.black,
                    ),
                    tooltip: "Add to Cart",
                    onPressed: () => addToCart(context),
                  ),
                ],
              ),
              RatingBar.builder(
                initialRating: prodect.rating ?? 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 4,
                itemSize: 18,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  // Handle rating update if necessary
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
