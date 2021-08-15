import 'package:flutter/material.dart';
import 'package:magazine_luiza/models/produtos.dart';
import 'package:magazine_luiza/provider/list.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset('logo.jpg'),
          title: Text('Ofertas do dia'),
          bottom: PreferredSize(
              child: Image.asset(
                'linha.jpg',
                fit: BoxFit.fill,
              ),
              preferredSize: Size.fromHeight(1))),
      body: ListView.separated(
          itemBuilder: builder,
          itemCount: 7,
          separatorBuilder: (_, index) {
            return Divider();
          }),
    );
  }

  Widget builder(BuildContext _, int index) {
    Product _products = listOfProducts.elementAt(index);
    return ListTile(
        trailing: IconButton(
          iconSize: 15,
          padding: const EdgeInsets.all(10.0),
          icon: (_products.isFavorite)
              ? Icon(Icons.favorite, color: Colors.purple)
              : Icon(Icons.favorite_outline, color: Colors.purple),
          onPressed: () {
            setState(() {
              _products.isFavorite = !_products.isFavorite;
            });
          },
        ),
        title: Row(
          children: [
            Image.asset(
              _products.photo,
              width: 100,
            ),
            Container(
              height: 140,
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _products.name,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    _products.subname,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Text(
                      _products.specification,
                      style: TextStyle(fontSize: 11),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 9),
                    child: Text(
                      _products.value,
                      style: TextStyle(
                          color: Colors.lightBlue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(_products.installment,
                      style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w300))
                ],
              ),
            )
          ],
        ));
  }
}
