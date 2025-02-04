import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled2/combs/itemcom/logincoms/myTextFild.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade600,
        toolbarHeight: 5.0.h,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // App Title
             Text(
              "E-Market",
              style: TextStyle(fontSize: 25.sp,color: Colors.green, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Input
                 Text(
                  "Email",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                MyTextField(controller: emailController, hintText: 'Enter email'),
                 SizedBox(height: 25.r),
                // Password Input
                 Text(
                  "Password",
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                MyTextField(controller: passwordController, hintText: 'Enter password'),
                 SizedBox(height: 25.r),
                // Sign In Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: const Color.fromARGB(255, 62, 214, 82),
                      height: 40.h,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        // TODO: Add sign-in logic
                    Navigator.pushReplacementNamed(context, 'homepage');

                      },
                      child:  Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Fast Login Divider
             Row(
              children: [
                const Expanded(child: Divider(thickness: 2)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Fast login",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold,color: Colors.black),
                  ),
                ),
                const Expanded(child: Divider(thickness: 2)),
              ],
            ),
            // Fast Login Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon:  Icon(Icons.facebook,size: 60.sp, color: Colors.blue,),
                  onPressed: () {
                    // TODO: Add Facebook login logic
                  },
                ),
                IconButton(
                  icon:  Icon(Icons.g_mobiledata,  size: 60.sp, color: Colors.red,),
                  onPressed: () {
                    // TODO: Add Google login logic
                  },
                ),
                IconButton(
                  icon:  Icon(Icons.apple,size: 60.sp, color: Colors.black),
                  onPressed: () {
                    // TODO: Add Apple login logic

                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
