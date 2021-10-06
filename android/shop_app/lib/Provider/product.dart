import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String id;
  String title;
  String image;
  double price;
  bool isFavourite;
  String description;

  Product({
    this.id,
    this.title,
    this.image,
    this.price,
    this.isFavourite=false,this.description
  });
  void toggleFavourite(){
    isFavourite=!isFavourite;
    notifyListeners();
  }
}
