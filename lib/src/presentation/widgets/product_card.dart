import 'package:flutter/material.dart';
import '../../services/favorite_service.dart';

class ProductCard extends StatefulWidget {
  final String name;
  final String price;
  final String imageUrl;
  final double rating;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.onTap,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  late bool isFav;

  @override
  void initState() {
    super.initState();
    // Instantané : SharedPreferences est déjà chargé au démarrage dans main()
    isFav = FavoriteService.isFavorite(widget.name);
  }

  Future<void> _toggleFavorite() async {
    if (isFav) {
      await FavoriteService.removeFavorite(widget.name);
    } else {
      await FavoriteService.addFavorite(widget.name);
    }

    setState(() {
      isFav = !isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(widget.imageUrl, fit: BoxFit.cover),
                ),

                // Bouton favoris instantané (plus de FutureBuilder)
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: _toggleFavorite,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.price,
                    style: const TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(5, (index) {
                      final isFilled = index < widget.rating.round();
                      return Icon(
                        isFilled ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 18,
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
