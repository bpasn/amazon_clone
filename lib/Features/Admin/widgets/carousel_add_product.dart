import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselSliderAddProduct extends StatelessWidget {
  const CarouselSliderAddProduct({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<File> images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images
          .map((File e) =>
              Builder(builder: (BuildContext context) => Image.file(e)))
          .toList(),
      options: CarouselOptions(
          enableInfiniteScroll: images.length > 1,
          viewportFraction: 1,
          height: 200),
    );
  }
}
