import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 5),
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20)
                ),
                  child: Text("\$${product.price.toString()}", 
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  )
              ),
              IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.heart, size: 18,))
            ],
          ),

          Image(image: AssetImage(product.image), width: 120, height: 120),
          Text(product.name),
          const SizedBox(height: 20,),
          const Button(child: Text("ADD TO CART"),),
        ],
      ),
    );
  }
}
