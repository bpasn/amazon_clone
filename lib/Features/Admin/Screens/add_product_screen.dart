import 'dart:io';

import 'package:amasona_clone/Common/Widgets/custom_button.dart';
import 'package:amasona_clone/Common/Widgets/custom_textfield.dart';
import 'package:amasona_clone/Constants/untlis.dart';
import 'package:amasona_clone/Features/Admin/services/admin_service.dart';
import 'package:amasona_clone/Features/Admin/widgets/app_bar_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../widgets/carousel_add_product.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  String category = 'Mobiles';
  List<String> productCategory = [
    'Mobiles',
    'Fashion',
    'Essentials',
    'Electronice',
    'Books',
  ];

  List<File> images = [];

  void selectImage() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  void sellProduct() {
    if (_formKey.currentState!.validate() && images.isNotEmpty) {
      try {
        AdminServide().sellProduct(
            context: context,
            name: productNameController.text,
            description: descriptionController.text,
            price: double.parse(priceController.text),
            quantity: double.parse(quantityController.text),
            category: category,
            images: images);
      } catch (e) {
        showSnackBar(context: context, text: e.toString());
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarWidget(
          addproduct: true,
          text: 'Add Product',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                images.isNotEmpty
                    ? CarouselSliderAddProduct(images: images)
                    : GestureDetector(
                        onTap: selectImage,
                        child: DottedBorder(
                          radius: const Radius.circular(10),
                          borderType: BorderType.RRect,
                          strokeWidth: 1.5,
                          color: Colors.black54,
                          dashPattern: const [10, 4],
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.folder_open,
                                  size: 40,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Select product image',
                                  style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                const SizedBox(height: 30),
                CustomTextField(
                    controller: productNameController,
                    hintText: 'Product name'),
                const SizedBox(height: 10),
                CustomTextField(
                    maxLines: 7,
                    controller: descriptionController,
                    hintText: 'Description'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: priceController, hintText: 'Prices'),
                const SizedBox(height: 10),
                CustomTextField(
                    controller: quantityController, hintText: 'Quantity'),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: DropdownButton(
                    value: category,
                    icon: const Icon(Icons.keyboard_arrow_down_outlined),
                    items: productCategory
                        .map(
                          (String menu) => DropdownMenuItem(
                            value: menu,
                            child: Text(menu),
                          ),
                        )
                        .toList(),
                    onChanged: (val) => setState(() {
                      category = val!;
                    }),
                  ),
                ),
                const SizedBox(height: 10),
                CustomButton(
                    isLoading: isLoading, text: "Sell", ontap: sellProduct),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
