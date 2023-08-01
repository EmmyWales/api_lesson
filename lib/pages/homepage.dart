import 'package:api_lesson/pages/product_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../class/Products.dart';
import 'commerce_page.dart';
// Assuming you have the ProductItem widget in a separate file.

class HomePage extends StatelessWidget {
  final dio = Dio();

  Stream<List<Products>> _fetchProducts() async* {
    try {
      final response = await dio.get('https://fakestoreapi.com/products');

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data;
        final List<Products> products =
            responseData.map((item) => Products.fromJson(item)).toList();
        yield products;
      } else {
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce App'),
      ),
      body: StreamBuilder<List<Products>>(
        stream: _fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final products = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    ProductDetails(product: products[index])));
                      },
                      child: ProductItem(product: products[index]));
                },
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching data'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
