import 'package:flutter/material.dart';
import 'package:shop_test/models/product_model.dart';

const List<ProductModel> availableProducts = [
  // First Product
  ProductModel(
    id: 1,
    title: "Polkadot Red Dress",
    price: 1499.00,
    image: "assets/images/product1.png",
    availableColors: [
      Colors.pink,
      Colors.red,
      Colors.green,
    ],
    availableSizes: [
      ProductSizes.xs,
      ProductSizes.s,
      ProductSizes.l,
    ],
  ),
  // Second Product
  ProductModel(
    id: 2,
    title: "Striped Pink Dress",
    price: 1499.00,
    image: "assets/images/product2.png",
    availableColors: [
      Colors.yellow,
      Colors.red,
      Colors.white,
    ],
    availableSizes: [
      ProductSizes.l,
      ProductSizes.s,
    ],
  ),
  // Third Product
  ProductModel(
    id: 3,
    title: "Polkadot Red Dress",
    price: 1499.00,
    image: "assets/images/product3.png",
    availableColors: [
      Colors.brown,
      Colors.yellow,
      Colors.purple,
    ],
    availableSizes: [
      ProductSizes.xs,
      ProductSizes.m,
    ],
  ),
  // Fourth Product
  ProductModel(
    id: 4,
    title: "Striped Green Dress",
    price: 1499.00,
    image: "assets/images/product4.png",
    availableColors: [
      Colors.green,
      Colors.blue,
      Colors.redAccent,
    ],
    availableSizes: [
      ProductSizes.s,
      ProductSizes.l,
    ],
  ),
];
