import 'package:flutter/material.dart';
import 'package:projet/components/product_card.dart';
import 'package:projet/data/get_product_list.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ecommerce')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchProductsFromApi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Aucun produit disponible.'));
          }
          final products = snapshot.data!;
          return LayoutBuilder(
            builder: (context, constraints) {
              double cardWith = 180;
              int crossAxisCount = (constraints.maxWidth / cardWith).floor();
              if (crossAxisCount < 2) {
                crossAxisCount = 2; // Minimum 2 cards per row
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  childAspectRatio: 0.66,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    name: products[index]['name'],
                    price: products[index]['price'],
                    imageUrl: products[index]['imageUrl'],
                  );
                },
              );
            },
          );
        },
      ),

      bottomNavigationBar: buttomNav(),
    );
  }

  BottomNavigationBar buttomNav() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
