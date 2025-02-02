import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
// 30% of screen width

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(
              prodect: prodect,
              heroTag: '${prodect.id}-${prodect.name}',
            ),
          ),
        );
      },
      child: Card(
       
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0).w,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Prevents excess space occupation
            children: [
              Hero(
                tag: '${prodect.id}-${prodect.name}', // Unique tag for each item
                child: Container(
                  width: 75.w,
                  height: 75.h, // Adjust height
                  child: prodect.imagePath.isNotEmpty
                      ? Image.asset(
                          prodect.imagePath,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          'assets/images/fallback_image.png',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
               SizedBox(height: 8.h),
              Text(
                prodect.name,
                style:  TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
                overflow: TextOverflow.ellipsis,
              ),
               SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    '\$${prodect.price.toStringAsFixed(2)}',
                    style:  TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
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
                initialRating: prodect.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 4,
                itemSize: 18.sp,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0).w,
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
