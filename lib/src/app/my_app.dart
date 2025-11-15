import 'package:flutter/material.dart';
import '../presentation/screens/main_screen.dart';
import '../theme/app_theme.dart';

/// Root widget used to bootstrap every phase of the course project.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      home: const MainScreen(),
    );
  }
}
