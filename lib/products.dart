// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  Widget _buildProduction(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push<bool>(context, MaterialPageRoute(
                  builder: (BuildContext context) => ProductPage(products[index]['title'], products[index]['image'])
                )).then((bool value) {
                  if(value) {
                    deleteProduct(index);
                  }
                }),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    if(products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProduction,
        itemCount: products.length,
      );
    } else {
      productCards = Center(child: Text('No products found, please add some'),);
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
