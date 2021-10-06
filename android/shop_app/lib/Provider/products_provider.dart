import 'package:flutter/material.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: "t1",
      title: "Shirt",
      image:
          "https://image.shutterstock.com/image-photo/classic-mens-shirts-stacked-260nw-382143802.jpg",
      price: 500,
    ),
    Product(
      id: "t2",
      title: "jeans",
      price: 600,
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRnK3hyQuochAOd4XSWwesU-QF6OmfvTFyeozg_7TkNB3w2OGpr&usqp=CAU",
    ),
    Product(
      id: "t3",
      title: "tops",
      price: 900,
      image:
          "https://4.imimg.com/data4/HY/JF/MY-9953785/stylish-ladies-tops-500x500.jpg",
    ),
    Product(
      id: "t4",
      title: "Suits",
      price: 9000,
      image:
          "https://5.imimg.com/data5/MB/PF/MY-3693506/designer-mens-suits-500x500.jpg",
    )
  ];
  List<Product> get items {
    return [..._items];
  }

  // ignore: non_constant_identifier_names
  List<Product> get Favouroites {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct(Product editingProduct) {
  const url='https://shopapp-40a93.firebaseio.com/products.json';
  http.post(url, body: json.encode({
    "title":editingProduct.title,
    "price":editingProduct.price,
    "description":editingProduct.description,
    "imageUrl":editingProduct.image,
    "isFavourite":editingProduct.isFavourite

  })).then((response){
    print(json.decode(response.body));
    final newProduct = Product(
      title: editingProduct.title,
      description: editingProduct.description,
      id: DateTime.now().toIso8601String(),
      price: editingProduct.price,
      image: editingProduct.image);
  _items.add(newProduct);
  notifyListeners();});

  }

  void updateProduct(String id , Product newProduct){
    final prodIndex=_items.indexWhere((prod)=>prod.id==id);
    if(prodIndex >= 0){
      _items[prodIndex]=newProduct;
      notifyListeners();

    }else{
      print("....");
    }
  }
  void deleteProduct(String id){
    _items.removeWhere((prod)=>prod.id==id);
    notifyListeners();
  }

}
