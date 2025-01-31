import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/mode/prodect.dart';
import 'package:untitled2/mode/shop.dart';

class ItemPage extends StatefulWidget {
  final Prodect prodect;

  const ItemPage({
    super.key,
    required this.prodect,
  });

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  double quantity = 0.0;

void addToCart(BuildContext context) {
  if (quantity > 0) {
    // Check if the product already exists in the cart
    bool productExists = context.read<Shop>().cart.any((item) => item.id == widget.prodect.id);

    if (productExists) {
      // If product exists, show a message or update the quantity
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.prodect.name} is already in your cart.')),
      );
    } else {
      // Proceed with adding the product to the cart if it doesn't exist
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add to Cart"),
          content: Text("Add $quantity kg of ${widget.prodect.name} to your cart?"),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
            MaterialButton(
              onPressed: () {
                context.read<Shop>().addToCart(widget.prodect, quantity); // Add product with quantity
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$quantity kg of ${widget.prodect.name} added to cart"),
                  ),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    }
  } else {
    // Show a warning if the quantity is 0
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please select a quantity before adding to cart")),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.prodect.price * quantity; // Calculate total price based on quantity

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade500,
        title: Text(
          'Item Detail',
          style: TextStyle(color: Colors.indigo.shade900, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.asset(widget.prodect.imagePath),
            ),
          ),
          Container(
            height: 40,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
                child: Text("1 Kg", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "\$${totalPrice.toStringAsFixed(2)}", // Display price dynamically
                style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            widget.prodect.name,
            style: TextStyle(fontSize: 15, color: Colors.indigo.shade800),
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Divider(height: 5),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Quantity',
              style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity = quantity + 0.5;
                  });
                },
                icon: const Icon(Icons.control_point_sharp, size: 50),
              ),
              Text(
                "$quantity Kg",
                style: const TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (quantity > 0) {
                      quantity = quantity - 0.5;
                    }
                  });
                },
                icon: const Icon(Icons.remove_circle_outline, size: 50),
              ),
            ],
          ),
          const SizedBox(height: 150),
          InkWell(
            onTap: () => addToCart(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, top: 8, bottom: 8, right: 40),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 186, 243, 188),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.blueGrey.shade700, fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 40),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                        child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
