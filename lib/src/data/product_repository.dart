import 'dart:convert';
import 'package:http/http.dart' as http;

// [Ajout] Mod�le simple repr�sentant un produit renvoy� par l'API FakeStore.
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final double rating;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final rating = json['rating'];
    return Product(
      name: json['title'] ?? 'Produit sans nom',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      imageUrl: json['image'] ?? '',
      rating: rating is Map<String, dynamic>
          ? (rating['rate'] as num?)?.toDouble() ?? 0
          : 0,
    );
  }

  /// Formatage lisible du prix affich� sur la carte.
  String get formattedPrice => '${price.toStringAsFixed(2)} \$';
}

/// R�cup�re la liste de produits depuis l'API FakeStore.
Future<List<Product>> fetchProductsFromApi() async {
  final uri = Uri.parse('https://fakestoreapi.com/products');
  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception(
      'Impossible de charger les produits (code ${response.statusCode}).',
    );
  }

  final List<dynamic> data = json.decode(response.body) as List<dynamic>;
  return data
      .map((item) => Product.fromJson(item as Map<String, dynamic>))
      .toList();
}
