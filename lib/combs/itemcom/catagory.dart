import 'package:flutter/material.dart';

class Catagory extends StatefulWidget {
  const Catagory({super.key});

  @override
  State<Catagory> createState() => _CatagoryState();
}

class _CatagoryState extends State<Catagory> {
  final List<String> imageList = [
      "lib/assets/download.webp",
     "lib/assets/potato-table.jpg",
     "lib/assets/fresh-organic-mint-garden.jpg",
     "lib/assets/close-up-view-whole-red-onions.jpg",  
     "lib/assets/download.webp",
     "lib/assets/potato-table.jpg",
     "lib/assets/fresh-organic-mint-garden.jpg",
     "lib/assets/close-up-view-whole-red-onions.jpg",
    // Add more asset paths here
  ];
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 160, // Adjust height as needed
     
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          
          Expanded(
       // Set height for the horizontal ListView
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scroll
              itemCount: imageList.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(200)
                        ),
                        child: 
                            ClipOval(
                            child: Image.asset(
                           imageList[i],
                           fit: BoxFit.cover,
                           width: 70,
                           height: 70,
                         ),
                       ),

                            
                        
                        
                      ),
                      const Text('data',style: TextStyle(color: Color.fromARGB(255, 127, 166, 185)),)
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
