import 'package:ecommerce_app/ui/screens/home.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    routes: {
      "/": (_) => const HomeScreen()
    },
  ));
}