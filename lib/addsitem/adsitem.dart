import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class adsitem extends StatefulWidget {
  const adsitem({super.key});

  @override
  State<adsitem> createState() => _adsitemyState();
}

class _adsitemyState extends State<adsitem> {
  final List<String> imageList = [
    "lib/assets/basket-tomatoes-black-surface.jpg",
    "lib/assets/basket-tomatoes-black-surface.jpg",
    "lib/assets/basket-tomatoes-black-surface.jpg",
    "lib/assets/basket-tomatoes-black-surface.jpg",
    "lib/assets/basket-tomatoes-black-surface.jpg",
    "lib/assets/basket-tomatoes-black-surface.jpg",

    // Add more asset paths here
  ];
 

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      height: 200.h, // Adjust height as needed
     
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
           SizedBox(height: 8.r),
          Expanded(
          
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Horizontal scroll
              itemCount: imageList.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0,left: 8.0,right: 8.0).w,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(20).w
                        ),
                        child: 
                         ClipRRect(
                          borderRadius: BorderRadius.circular(20).w,
                           child:  Image.asset(
                              imageList[i],
                              fit: BoxFit.fill,
                              width: 350.w,
                              height: 150.h,
                              
                            ),
                         ),
                        
                        
                      ),
                   
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
