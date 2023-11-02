import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function()? onAddToCart;
  final Function()? onRemoveFromCart;
  final bool addedToCart;
  const ProductCard({super.key, required this.product, this.onAddToCart, this.onRemoveFromCart, this.addedToCart = false});

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
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(20)
                ),
                  child: Text("${product.quantity}",
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  )
              ),
              IconButton(
                  onPressed: onRemoveFromCart,
                  icon: addedToCart ? FaIcon(FontAwesomeIcons.heart, color: Theme.of(context).colorScheme.error,) : const FaIcon(FontAwesomeIcons.heart, size: 18,)
              )
            ],
          ),

          Image(image: AssetImage(product.image), width: 120, height: 120),
          Text(product.name),
          const SizedBox(height: 20,),
          Button(onPressed: onAddToCart, child: const Text("ADD TO CART"),),
        ],
      ),
    );
  }
}
