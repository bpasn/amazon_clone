import 'package:amasona_clone/Common/Widgets/loader.dart';
import 'package:amasona_clone/Features/Account/widgets/single_produce.dart';
import 'package:amasona_clone/Features/Admin/services/admin_service.dart';
import 'package:flutter/material.dart';

import '../../../Models/product_model.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostsScreen> {
  List<Product>? productList = [];
  void navigationToAddProduct() => Navigator.pushNamed(context, '/add-product');
  @override
  void initState() {
    super.initState();
    fetchAllProduct();
  }

  fetchAllProduct() async {
    productList= await AdminServide().getAllProduct(context);
    setState(() => {});
  }

  @override
  Widget build(BuildContext context) {
    return productList == null 
        ? const Loader()
        :  productList!.length == 0 ? const Loader() : Scaffold(
            body: GridView.builder(
              itemCount: productList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                final product = productList![index];
                return Column(
                  children: [
                    SizedBox(
                      height: 139.5,
                      child: ProductWidget(
                        image: product.images[0],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.delete_outline))
                      ],
                    ),
                  ],
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: navigationToAddProduct,
              tooltip: "Add a Product",
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
