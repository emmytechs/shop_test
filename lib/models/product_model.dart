import 'package:flutter/material.dart';

class ProductModel {
  final int id;
  final String title;
  final double price;
  final String image;
  final List<Color> availableColors;
  final List<ProductSizes> availableSizes;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.availableColors,
    required this.availableSizes,
  });
}

enum ProductSizes { xs, s, m, l }
