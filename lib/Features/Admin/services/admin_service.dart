import 'dart:convert';
import 'dart:io';

import 'package:amasona_clone/Constants/error_handling.dart';
import 'package:amasona_clone/Constants/untlis.dart';
import 'package:amasona_clone/Features/Auth/Services/client_service.dart';
import 'package:amasona_clone/Models/product_model.dart';
import 'package:amasona_clone/Models/user_model.dart';
import 'package:amasona_clone/Providers/user_provider.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

ClientService clirentService = ClientService();

class AdminServide {
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required double quantity,
    required String category,
    required List<File> images,
    // String? token,
  }) async {
    try {
      final cloudinary = CloudinaryPublic('dsez9utnb', "iwnaz4ur");
      User userProvider =
          Provider.of<UserProvider>(context, listen: false).user;
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary
            .uploadFile(CloudinaryFile.fromFile(images[i].path));
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          images: imageUrls,
          category: category);
      http.Response res = await clirentService.post(
          url: '/admin-add-product',
          body: product.toJson(),
          token: userProvider.token);
      httpErrorHander(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context: context, text: "Product Added Successfully!");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context: context, text: e.toString());
    }
  }

  Future<List<Product>> getAllProduct(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await clirentService.get(
          url: '/admin-get-allproduct', token: userProvider.user.token);
      httpErrorHander(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(
                  jsonEncode(
                    jsonDecode(res.body)[i],
                  ),
                ),
              );
            }
          });
    } catch (e) {
      print(e.toString());
      showSnackBar(context: context, text: e.toString());
    }

    return productList;
  }
}
