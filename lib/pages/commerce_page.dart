import 'package:flutter/material.dart';
import '../class/Products.dart'; // Importing the Products class (Assumed to be defined in a different file)

class ProductItem extends StatelessWidget {
  final Products product;

  const ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product.image, // Assuming you have an "imageUrl" property in the Products class to show the product image.
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title, // Assuming you have a "title" property in the Products class to show the product title.
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              '\$${product.price}', // Assuming you have a "price" property in the Products class to show the product price.
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
