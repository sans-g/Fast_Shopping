import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/Provider/product.dart';
import 'package:shopapp/Provider/products_provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routename = "/Editing-Adding";
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imagecontroller = TextEditingController();
  final _imageUrlFocus = FocusNode();
  final _form = GlobalKey<FormState>();
  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    _priceFocusNode.dispose();
    _imagecontroller.dispose();
    _imageUrlFocus.dispose();
    _imageUrlFocus.removeListener(urlListener);
    // TODO: implement dispose
    super.dispose();
  }

  var _inItValues = {
    "title": "",
    "description": "",
    "price": "",
    "imageUrl": "",
  };

  var _isInit = true;
  @override
  void initState() {
    _imageUrlFocus.addListener(urlListener);
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if (productId != null) {
        _productForm =
            Provider.of<Products>(context, listen: false).findById(productId);
        _inItValues = {
          "title": _productForm.title,
          "description": _productForm.description,
          "price": _productForm.price.toString(),
          "imageUrl": "",
        };
        _imagecontroller.text = _productForm.image;
      }
    }
    _isInit = false;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  void urlListener() {
    if (!_imageUrlFocus.hasFocus) {
      setState(() {});
    }
  }

  void _saveForm() {
    final _isvalidate = _form.currentState.validate();
    if (!_isvalidate) {
      return;
    }
    _form.currentState.save();
    if (_productForm.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_productForm.id, _productForm);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_productForm);
    }

    Navigator.of(context).pop();
  }

  var _productForm =
      Product(id: null, price: 0, title: "", image: "", description: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Product"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _inItValues["title"],
                decoration: InputDecoration(
                  labelText: "Title",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "This is Empty";
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_priceFocusNode);
                },
                onSaved: (value) {
                  _productForm = Product(
                      title: value,
                      image: _productForm.image,
                      price: _productForm.price,
                      id: _productForm.id,
                      description: _productForm.description);
                },
              ),
              TextFormField(
                initialValue: _inItValues["price"],
                decoration: InputDecoration(
                  labelText: "Price",
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                focusNode: _priceFocusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descriptionFocusNode);
                },
                onSaved: (value) {
                  _productForm = Product(
                      title: _productForm.title,
                      image: _productForm.image,
                      price: double.parse(value),
                      id: _productForm.id,
                      description: _productForm.description);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "This is Empty";
                  }
                  if (double.parse(value) <= 0) {
                    return "Price can not o";
                  }
                  if (double.tryParse(value) == null) {
                    return "Enter a valid number ";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                initialValue: _inItValues["description"],
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                focusNode: _descriptionFocusNode,
                onSaved: (value) {
                  _productForm = Product(
                      title: _productForm.title,
                      image: _productForm.image,
                      price: _productForm.price,
                      id: _productForm.id,
                      description: value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return "This is Empty";
                  } else {
                    return null;
                  }
                },
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 100,
                    margin: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: _imagecontroller.text.isEmpty
                        ? Text("Error Loading")
                        : FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(_imagecontroller.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: "Image",
                      ),
                      keyboardType: TextInputType.url,
                      controller: _imagecontroller,
                      focusNode: _imageUrlFocus,
                      onSaved: (value) {
                        _productForm = Product(
                            title: _productForm.title,
                            image: value,
                            price: _productForm.price,
                            id: _productForm.id,
                            description: _productForm.description);
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return "This is Empty";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
