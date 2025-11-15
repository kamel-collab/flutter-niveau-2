import 'package:flutter/material.dart';
import '../../data/demo_product.dart';
import '../widgets/main_bottom_nav.dart';
import '../widgets/product_card.dart';

/// Displays the placeholder home content with the AppBar and BottomNavigationBar.
// [Modification] L'�cran pr�sente maintenant une grille responsive pour la phase 3.
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          // [Ajout] On calcule le nombre "id�al" de colonnes � partir de la largeur disponible.
          const double cardWidth = 180;
          int crossAxisCount = (constraints.maxWidth / cardWidth).floor();
          if (crossAxisCount < 2) {
            crossAxisCount = 2;
          }

          return Padding(
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              itemCount: demoProductList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.62,
              ),
              itemBuilder: (context, index) {
                final product = demoProductList[index];
                return ProductCard(
                  name: product.name,
                  price: product.price,
                  imageUrl: product.imageUrl,
                  onTap: () {},
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
