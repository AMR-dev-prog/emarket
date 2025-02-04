import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/combs/itemcom/logincoms/itemtile.dart';
import 'package:untitled2/mode/shop.dart';

class ItemList extends StatefulWidget {
  final String category;
  const ItemList({super.key, required this.category});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  late List prodects = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    prodects = context.read<Shop>().shop; // Use `read` to avoid unnecessary rebuilds
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.category,
            style:  TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
            ),
          ),
           SizedBox(height: 8.r),
          // Remove the scroll behavior by using a GridView without scroll
          Container(
            child: GridView.count(
          
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 4,
              childAspectRatio: 1.7 / 3,
              shrinkWrap: true, // Ensures the grid is only as tall as necessary
           physics: const NeverScrollableScrollPhysics(),
               // Disable scrolling
              children: List.generate(
                prodects.length < 6 ? prodects.length : 6,
                (index) {
                  final prodact = prodects[index];
                  return ItemTile(product: prodact);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
