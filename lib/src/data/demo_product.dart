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
  price: '199,99 �',
  imageUrl:
      'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&w=600&q=80',
);

// [Ajout] Liste plus compl�te pour la phase 3 afin de construire une grille de produits.
const List<DemoProduct> demoProductList = [
  DemoProduct(
    name: 'Casque Audio Pro',
    price: '199,99 �',
    imageUrl:
        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?auto=format&fit=crop&w=600&q=80',
  ),
  DemoProduct(
    name: 'Montre Connect�e',
    price: '149,99 �',
    imageUrl:
        'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=600&q=80',
  ),
  DemoProduct(
    name: 'Smartphone Lite',
    price: '299,00 �',
    imageUrl:
        'https://images.unsplash.com/photo-1510557880182-3d4d3cba35a5?auto=format&fit=crop&w=600&q=80',
  ),
  DemoProduct(
    name: 'Enceinte Bluetooth',
    price: '89,90 �',
    imageUrl:
        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80',
  ),
  DemoProduct(
    name: 'Appareil Photo',
    price: '649,00 �',
    imageUrl:
        'https://images.unsplash.com/photo-1472214103451-9374bd1c798e?auto=format&fit=crop&w=600&q=80',
  ),
  DemoProduct(
    name: 'Chaise de Bureau',
    price: '249,00 �',
    imageUrl:
        'https://images.unsplash.com/photo-1524758631624-e2822e304c36?auto=format&fit=crop&w=600&q=80',
  ),
];
