import 'package:flutter/material.dart';
import '../../data/product_repository.dart';
import '../widgets/main_bottom_nav.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = '/';

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
            return Center(child: Text('Erreur : ${snapshot.error}'));
          }

          final products = snapshot.data ?? [];

          if (products.isEmpty) {
            return const Center(child: Text('Aucun produit disponible.'));
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              const double cardWidth = 180;
              int crossAxisCount = (constraints.maxWidth / cardWidth).floor();
              if (crossAxisCount < 2) crossAxisCount = 2;

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
                      rating: product.rating,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          ProductDetailScreen.routeName,
                          arguments: product, // <--- On passe l'objet complet
                        );
                      },
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
