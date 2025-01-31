import 'package:flutter/material.dart';

class CoasetAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  const CoasetAppBar({
    super.key,
    required this.title,  // Title is required
    this.leading,         // Optional leading widget
    this.actions,         // Optional actions widget list
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
        color: Colors.green, // Background color for the AppBar container
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: leading,
        actions: actions,
        backgroundColor: Colors.transparent, // Make AppBar background transparent
        elevation: 0, // Remove the shadow
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 50); // Adjust total height to account for custom padding
}
