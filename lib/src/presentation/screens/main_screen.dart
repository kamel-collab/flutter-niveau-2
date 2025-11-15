import 'package:flutter/material.dart';
import '../../data/demo_product.dart';
import '../widgets/main_bottom_nav.dart';
import '../widgets/product_card.dart';

/// Displays the placeholder home content with the AppBar and BottomNavigationBar.
// [Modification] L'�cran pr�sente maintenant la carte produit centr�e pour la phase 2.
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
      body: Center(
        // [Modification] On affiche une carte produit unique pour expliquer la composition d'un item.
        child: ProductCard(
          name: demoProduct.name,
          price: demoProduct.price,
          imageUrl: demoProduct.imageUrl,
          onTap: () {},
        ),
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
