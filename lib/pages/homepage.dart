import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/addsitem/adsitem.dart';
import 'package:untitled2/combs/itemcom/catagory.dart';
import 'package:untitled2/combs/itemcom/logincoms/Drawer.dart';
import 'package:untitled2/combs/itemcom/iteamlist.dart';
import 'package:untitled2/pagecombs/costappbar%20copy.dart';
import 'package:untitled2/pagecombs/serch.dart';
import 'package:untitled2/pages/SerchPage.dart';
import 'package:untitled2/pages/cart.dart';
import 'package:untitled2/pages/usersPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late int selectedtab;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedtab = 0; // Initialize the selected tab
  }

  final List<Widget> _pages = [
    const HomepageContent(), // Extracted content for Homepage
     const SearchPage(), // Placeholder
    const CartPage(),
    const Center(child: Text("Offers Page")), // Placeholder
    const Userspage(), // Placeholder
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedtab = index; // Update the selected tab
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Attach the scaffold key here
      appBar: CoasetAppBar(
        
        title: 'E-market',
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer(); // Open the drawer
          },
        ),
        actions: [
           IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearch());
           }, icon: const Icon(Icons.search)),
           IconButton(
            icon: const Icon(
              Icons.add_location,
              color: Colors.black, // Set the icon color to black
            ),
            onPressed: () {
              debugPrint("Location icon tapped");
            },
          ),
          
        ],
      ),
      drawer: const CustomDrawer(), // Your custom drawer widget
      body: _pages[selectedtab],
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedtab,
        onTap: _onItemTapped,
        items: const [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.search, color: Colors.white),
            label: 'Search',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 35),
            label: 'Cart',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.local_offer_outlined, color: Colors.white),
            label: 'Offers',
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.perm_identity, color: Colors.white),
            label: 'Personal',
          ),
        ],
        color: Colors.green,
        buttonBackgroundColor: Colors.green,
        backgroundColor: const Color.fromARGB(255, 250, 252, 250),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}

// Extracted homepage content for better readability
class HomepageContent extends StatelessWidget {
  const HomepageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const adsitem(),
          const Catagory(),
          const ItemList(category: "best seller"),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Image.asset(
              "lib/assets/7492348.jpg",
              fit: BoxFit.cover,
            ),
          ),
          const ItemList(category: 'new items'),
        ],
      ),
    );
  }
}
