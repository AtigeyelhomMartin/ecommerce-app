import 'package:ecommerce_app/models/Product.dart';
import 'package:ecommerce_app/ui/widgets/product.card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> _products = [
    Product(
        id: "1",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "2",
        name: "Iphone",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/iphone.png'
    ),
    Product(
        id: "3",
        name: "Logitech Mouse",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/mouse.png'
    ),
    Product(
        id: "4",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "5",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
    Product(
        id: "6",
        name: "Shoes",
        price: 10,
        quantity: 20,
        image: 'assets/images/products/shoes.png'
    ),
  ];
  final Map<String, Product> _cart = {};

  List<Product> getProducts(){
    return _products.map((product){
      Product? cartItem = _cart[product.id];
      int productQuantityInCart = 0;
      if(cartItem != null){
        productQuantityInCart = cartItem.quantity;
      }
      return Product.fromJson({...product.toJson(), "quantity": product.quantity - productQuantityInCart });
    }).toList();
  }

  addToCart(Product product){
    Product? cartItem =  _cart[product.id];
    if(cartItem != null){
      if(product.quantity == 0) return;
      setState(() {
        _cart[product.id] = Product.fromJson({...product.toJson(), "quantity":  cartItem.quantity + 1 });
      });
    }else{
      setState(() {
        _cart[product.id] = Product.fromJson({...product.toJson(), "quantity": 1 });
      });
    }
  }

  removeCart(Product product){
    setState(() {
      _cart.remove(product.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8, bottom: _cart.isEmpty ? 8 : 80),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                childAspectRatio: 4/6
              ),
              itemCount: getProducts().length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                    key: Key(getProducts()[index].id),
                    product: getProducts()[index],
                    onAddToCart: () => addToCart(getProducts()[index]),
                    onRemoveFromCart: () => removeCart(getProducts()[index]),
                    addedToCart: _cart[getProducts()[index].id] != null,
                );
              },
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: _cart.isEmpty ? -200 : 10,
            child: Container(
              height: 70,
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _cart.keys.map((key) =>
                    Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Image(image: AssetImage(_cart[key]!.image), width: 45, height: 45),
                    )
                ).toList(),
              ),
            )
          )
        ],
      ),
    );
  }
}