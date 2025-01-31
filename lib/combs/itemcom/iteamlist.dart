import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/combs/itemcom/logincoms/itemtile.dart';
import 'package:untitled2/mode/shop.dart';

class ItemList extends StatefulWidget {
  final String category;
  const ItemList({super.key,required this.category});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
   late List prodects;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Access context here instead of in an initializer
    prodects = context.watch<Shop>().shop;
  }


  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            widget.category,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 400, // Set height to show 2 rows of items (adjust based on item size)
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // 3 items per row
                crossAxisSpacing: 0, // Spacing between columns
                mainAxisSpacing: 0, // Spacing between rows
                childAspectRatio: 2 / 3, // Aspect ratio of each item
              ),
              itemCount: prodects.length,
              itemBuilder: (context, index) {
                final prodact =prodects[index];
                return ItemTile(prodect: prodact);
              },
            ),
          ),
        ],
      ),
    );
  }
}
