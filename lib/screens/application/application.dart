import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_test/data/product_data.dart';
import 'package:shop_test/models/product_model.dart';
import 'package:shop_test/screens/application/pages/cart/cart.dart';
import 'package:shop_test/screens/application/pages/home/home.dart';
import 'package:shop_test/screens/application/pages/menu/menu.dart';
import 'package:shop_test/screens/application/pages/profile/profile.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final List<ProductModel> _shopProducts = availableProducts;

  final List<ProductModel> _favoriteProducts = [];
  final List<ProductModel> _cartProducts = [];

  bool isFavorite(ProductModel currentProduct) {
    for (var product in _favoriteProducts) {
      if (product.id == currentProduct.id) {
        return true;
      }
    }
    return false;
  }

  void onTapFavorite(ProductModel product) {
    // Add or remove product from favorite
    if (isFavorite(product)) {
      setState(() {
        _favoriteProducts.remove(product);
      });
    } else {
      setState(() {
        _favoriteProducts.add(product);
      });
    }
  }

  int _selectedIndex = 0;

  Widget getApplicationScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen(
          onTapFavorite: onTapFavorite,
          allProducts: _shopProducts,
          cartProducts: _cartProducts,
          favoriteProducts: _favoriteProducts,
        );
      case 1:
        return const MenuScreen();
      case 2:
        return const CartScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const Application();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getApplicationScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.pink,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Colors.pink,
            ),
          ),
          BottomNavigationBarItem(
            label: "Menu",
            activeIcon: Icon(
              Icons.menu_sharp,
              color: Colors.pink,
            ),
            icon: Icon(
              Icons.menu,
              color: Colors.pink,
            ),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            activeIcon: Icon(
              CupertinoIcons.cart_fill,
              color: Colors.pink,
            ),
            icon: Icon(
              CupertinoIcons.cart,
              color: Colors.pink,
            ),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(
              CupertinoIcons.person_fill,
              color: Colors.pink,
            ),
            icon: Icon(
              CupertinoIcons.person,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
