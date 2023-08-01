import 'package:api_lesson/class/Products.dart';
import 'package:api_lesson/pages/commerce_page.dart';
import 'package:api_lesson/pages/homepage.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Products product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
        ),
        title: const Text("Product Details"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    product.image,
                    height: MediaQuery.sizeOf(context).height / 2,
                    width: 180,
                  ),
                ),
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.description,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  '\$${product.price.toString()}',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    height: 50,
                    width: 280,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          "BUY NOW",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
