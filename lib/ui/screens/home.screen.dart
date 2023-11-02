import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/ui/widgets/product.card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products = [
    Product(
        id: "1",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "1",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "1",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "1",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "1",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "1",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 4/6
          ),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}