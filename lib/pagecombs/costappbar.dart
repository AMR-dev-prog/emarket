import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          // Location Icon
          IconButton(
            icon: const Icon(
              Icons.add_location,
              color: Colors.black, // Set the icon color to black
            ),
            onPressed: () {
              debugPrint("Location icon tapped");
            },
          ),
          // Search Bar
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Search",
                fillColor: Colors.white, // White background for the search box
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 199, 20, 20),
                  size: 25,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
          ),
          const SizedBox(width: 8), // Spacing between the text field and the menu icon
          // Menu Icon to Open Drawer
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black, // Set the icon color to black
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            ),
          ),
        ],
      ),
    );
  }
}