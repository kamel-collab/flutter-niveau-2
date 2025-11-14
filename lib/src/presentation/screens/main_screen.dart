import 'package:flutter/material.dart';
import '../widgets/main_bottom_nav.dart';

/// Displays the placeholder home content with the AppBar and BottomNavigationBar.
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My E-Commerce',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        elevation: 4,
      ),
      body: const Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}