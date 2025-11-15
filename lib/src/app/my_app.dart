import 'package:flutter/material.dart';

import '../presentation/screens/main_screen.dart';
import '../presentation/screens/product_detail_screen.dart';
import '../theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),

      home: const MainScreen(),

      routes: {
        // Route vers la page détail
        ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
      },
    );
  }
}
