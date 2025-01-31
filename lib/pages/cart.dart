import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/mode/prodect.dart';
import 'package:untitled2/mode/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Watch the cart list from the Shop provider
    final cart = context.watch<Shop>().cart;

    void removeItemCart(BuildContext context, Prodect product) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Icon(Icons.delete,color: Colors.green,size: 40,),
          content: const Text("Delete this item from your cart?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Cancel"),
            ),
           
            TextButton(
              onPressed: () {
                context.read<Shop>().removeFromCart(product);
                Navigator.of(context).pop(); // Close the dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${product.name} removed from cart")),
                );
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
     
      body: cart.isEmpty
          ? Center(
              child: Text(
                'Your cart is empty.',
                style: TextStyle(fontSize: 20, color: Colors.grey.shade700),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        child: Card(
                          elevation: 3,
                          child: ListTile(
                            title: Text(item.name),
                            subtitle: Text(
                              'Quantity: ${item.quantity}\nPrice: \$${item.totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500
                            ),),
                             trailing: SizedBox(
  width: 100, // Restrict width to avoid overflow
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        onPressed: () => context.read<Shop>().increaseQuantity(item),
        icon: const Icon(Icons.add_box_rounded),
      ),
      IconButton(
        onPressed: () => context.read<Shop>().decreaseQuantity(item),
        icon: const Icon(Icons.indeterminate_check_box_rounded,),
      ),
    ],
  ),
),

                            leading: IconButton(
                              onPressed: () => removeItemCart(context, item),
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Total: \$${cart.fold<double>(0, (double sum, item) => sum + item.totalPrice).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
              ],
            ),
    );
  }
}
