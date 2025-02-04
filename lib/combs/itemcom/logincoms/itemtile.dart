import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/mode/prodect.dart';
import 'package:untitled2/mode/shop.dart';
import 'package:untitled2/pages/ItemPage.dart';

class ItemTile extends StatelessWidget {
  final Prodect product;

  ItemTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
         double fontSize = constraints.maxWidth * 0.12; 
        double iconSize = constraints.maxWidth * 0.25; 
        double ratingItemSize = constraints.maxWidth * 0.15;

        return InkWell(
           onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(
              prodect: product,
              heroTag: '${product.id}-${product.name}',
            ),
          ),
        );},
          child: SizedBox(
            width: 100.r,
            height: 100.r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Padding(
                 padding:  EdgeInsets.all(2.w),
                 child: Container(
                  height: 80.h,
                  width: 80.w,
                  child: Hero(
                  tag: '${product.id}-${product.name}', // Unique tag for each item
                  child: SizedBox(
                    width: 75.r, // Ensures proportional scaling
                    height: 75.r,
                    child: product.imagePath.isNotEmpty
                        ? Image.asset(product.imagePath, fit: BoxFit.cover)
                        : Image.asset('assets/images/fallback_image.png', fit: BoxFit.cover),
                  ),
                ),
              ),
                ),
                
               
               Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
          
                Text(
                  product.price.toString(),
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.black, size: iconSize),
                  tooltip: "Add to Cart",
                  onPressed: () => addToCart(context),
                ),
                  ]
                ),
                RatingBar.builder(
                  initialRating: product.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 4,
                  itemSize: ratingItemSize,
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                  itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    // Handle rating update if necessary
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

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
              context.read<Shop>().addToCart(product, product.quantity);
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text("Confirm"),
          ),
        ],
      ),
    );
  }
}
