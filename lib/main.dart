import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/mode/shop.dart';
import 'package:untitled2/pages/homepage.dart';
import 'package:untitled2/pages/loginPage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context)=>Shop(),
      child: const MyApp()
      )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       ScreenUtilInit(
        designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
         child: Container(
          color: Colors.white,
           child: SafeArea(
             child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const Loginpage(),
              routes: {
                "homepage":(context)=>const Homepage(),
              
              }
                   ),
           ),
         ),
       );
    
  }
}


