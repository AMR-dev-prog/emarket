import 'package:flutter/material.dart';
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
        toolbarHeight: 5.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // App Title
            const Text(
              "E-Market",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Email Input
                const Text(
                  "Email",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                MyTextField(controller: emailController, hintText: 'Enter email'),
                const SizedBox(height: 25),
                // Password Input
                const Text(
                  "Password",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                MyTextField(controller: passwordController, hintText: 'Enter password'),
                const SizedBox(height: 25),
                // Sign In Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      color: const Color.fromARGB(255, 62, 214, 82),
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      onPressed: () {
                        // TODO: Add sign-in logic
                    Navigator.pushReplacementNamed(context, 'homepage');

                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Fast Login Divider
            const Row(
              children: [
                Expanded(child: Divider(thickness: 2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Fast login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Divider(thickness: 2)),
              ],
            ),
            // Fast Login Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.facebook,size: 60, color: Colors.blue,),
                  onPressed: () {
                    // TODO: Add Facebook login logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.g_mobiledata,  size: 60, color: Colors.red,),
                  onPressed: () {
                    // TODO: Add Google login logic
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.apple,size: 60, color: Colors.black),
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
