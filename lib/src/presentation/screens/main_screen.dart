import 'package:flutter/material.dart';
import '../../data/product_repository.dart';
import '../widgets/main_bottom_nav.dart';
import '../widgets/product_card.dart';

/// Displays the placeholder home content with the AppBar and BottomNavigationBar.
// [Modification] La phase 4 consomme maintenant l'API FakeStore et affiche la grille dynamique.
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
      body: FutureBuilder<List<Product>>(
        future: fetchProductsFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erreur de chargement : ${snapshot.error}',
                textAlign: TextAlign.center,
              ),
            );
          }
          final products = snapshot.data ?? [];
          if (products.isEmpty) {
            return const Center(child: Text('Aucun produit disponible.'));
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              // [Ajout] Reprise du calcul de colonnes pour s'adapter � la largeur.
              const double cardWidth = 180;
              int crossAxisCount = (constraints.maxWidth / cardWidth).floor();
              if (crossAxisCount < 2) {
                crossAxisCount = 2;
              }

              return Padding(
                padding: const EdgeInsets.all(8),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.62,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      name: product.name,
                      price: product.formattedPrice,
                      imageUrl: product.imageUrl,
                      onTap: () {},
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
