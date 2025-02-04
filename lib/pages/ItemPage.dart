import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/mode/prodect.dart';
import 'package:untitled2/mode/shop.dart';

class ItemPage extends StatefulWidget {
  final Prodect prodect;
  final String heroTag;

  const ItemPage({
    super.key,
    required this.prodect,
    required this.heroTag,
  });

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  double quantity = 0.0;

  void addToCart(BuildContext context) {
    if (quantity > 0) {
      bool productExists = context.read<Shop>().cart.any((item) => item.id == widget.prodect.id);

      if (productExists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.prodect.name} is already in your cart.')),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Add to Cart"),
            content: Text("Add $quantity kg of ${widget.prodect.name} to your cart?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  context.read<Shop>().addToCart(widget.prodect, quantity);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("$quantity kg of ${widget.prodect.name} added to cart")),
                  );
                },
                child: const Text("Confirm"),
              ),
            ],
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a quantity before adding to cart")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.prodect.price * quantity;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: Text(
          'Item Detail',
          style: TextStyle(color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 50.h,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: 360.w,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: SizedBox(
                width:MediaQuery.of(context).size.height,
                height: 120.r,
                child: Hero(
                  tag: widget.heroTag, // Add hero animation for smooth transition
                  child: Image.asset(widget.prodect.imagePath, width: MediaQuery.of(context).size.height,),
                ),
              ),
            ),
            Container(
              height: 40.h,
              width: 60.w,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text("1 Kg", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "\$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 50.sp, fontWeight: FontWeight.bold, color: Colors.amberAccent),
                ),
              ],
            ),
            Text(
              widget.prodect.name,
              style: TextStyle(fontSize: 15.sp, color: Colors.indigo.shade800),
            ),
            Padding(
              padding: EdgeInsets.all(20.0.w),
              child: Divider(thickness: 5.h), // Corrected Divider
            ),
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Text(
                'Quantity',
                style: TextStyle(fontSize: 20.sp, color: Colors.grey.shade800),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      quantity += 0.5;
                    });
                  },
                  icon: Icon(Icons.add_circle_outline, size: 50.r),
                ),
                Text(
                  "$quantity Kg",
                  style: TextStyle(color: Colors.black, fontSize: 40.sp, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (quantity > 0) {
                        quantity -= 0.5;
                      }
                    });
                  },
                  icon: Icon(Icons.remove_circle_outline, size: 50.r),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 10.5),
            InkWell(
              onTap: () => addToCart(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 8.h),
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 186, 243, 188),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Container(
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(color: Colors.white, fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
