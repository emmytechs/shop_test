import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_test/models/product_model.dart';
import 'package:shop_test/screens/application/pages/home/widgets/home_widgets.dart';
import 'package:shop_test/screens/product_detail/product_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.allProducts,
    required this.favoriteProducts,
    required this.cartProducts,
    required this.onTapFavorite,
  });

  final List<ProductModel> allProducts;
  final List<ProductModel> favoriteProducts;
  final List<ProductModel> cartProducts;
  final void Function(ProductModel product) onTapFavorite;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchController;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    _searchController = TextEditingController();
    _searchFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  bool isFavorite(ProductModel currentProduct) {
    for (var product in widget.favoriteProducts) {
      if (product.id == currentProduct.id) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.pinkAccent.withOpacity(0.1),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.pinkAccent.withOpacity(0.1),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(CupertinoIcons.gear_big),
                      ),
                      const SizedBox(
                        height: 45,
                        width: 45,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Match your style",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 44,
                    child: TextField(
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      onTapOutside: (event) {
                        if (_searchFocusNode.hasFocus) {
                          _searchFocusNode.unfocus();
                        }
                      },
                      autofocus: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        fillColor: Colors.white,
                        filled: true,
                        isDense: true,
                        hintText: "Search",
                        hintStyle: TextStyle(
                          color: Colors.pinkAccent.withOpacity(0.6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIconColor: Colors.pinkAccent.withOpacity(0.6),
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GridView.builder(
                    itemCount: widget.allProducts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.66,
                    ),
                    itemBuilder: (context, index) {
                      final product = widget.allProducts[index];

                      return ProductCard(
                        onTapProduct: (product) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetail(
                              cartProducts: widget.cartProducts,
                              favoriteProducts: widget.favoriteProducts,
                              product: product,
                            ),
                          ));
                        },
                        onTapFavorite: widget.onTapFavorite,
                        product: product,
                        isFavorite: isFavorite(product),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
