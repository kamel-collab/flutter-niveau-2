// [Ajout] D�finition d'un produit de d�monstration pour illustrer la carte centrale.
class DemoProduct {
  final String name;
  final String price;
  final String imageUrl;

  const DemoProduct({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

/// Produit fictif utilis� pour pr�senter le design durant la phase 2.
const DemoProduct demoProduct = DemoProduct(
  name: 'Casque Audio Pro',
  price: '199,99 da',
  imageUrl:
      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&w=600&q=80',
);
