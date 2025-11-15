import 'dart:convert';
import 'package:http/http.dart' as http;

// [Ajout] Modèle simple représentant un produit renvoyé par l'API FakeStore.
class Product {
  final String name;
  final double price;
  final String imageUrl;
  final double rating;
  final String description;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final ratingData = json['rating'];
    return Product(
      name: json['title'] ?? 'Produit sans nom',
      price: (json['price'] as num?)?.toDouble() ?? 0,
      imageUrl: json['image'] ?? '',
      rating: ratingData is Map<String, dynamic>
          ? (ratingData['rate'] as num?)?.toDouble() ?? 0
          : 0,
      description: json['description'] ?? 'Pas de description fournie.',
    );
  }

  /// Retourne un prix formaté pour limiter le code dans les widgets.
  String get formattedPrice => '${price.toStringAsFixed(2)} \$';
}

/// [Ajout] Service qui interroge l'API FakeStore et convertit la réponse en `Product`.
Future<List<Product>> fetchProductsFromApi() async {
  final uri = Uri.parse('https://fakestoreapi.com/products');
  final response = await http.get(uri);

  if (response.statusCode != 200) {
    throw Exception('Impossible de charger les produits (code ${response.statusCode}).');
  }

  final List<dynamic> jsonList = json.decode(response.body) as List<dynamic>;
  return jsonList
      .map((item) => Product.fromJson(item as Map<String, dynamic>))
      .toList();
}