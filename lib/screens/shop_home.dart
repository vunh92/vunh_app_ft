
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopHome extends StatefulWidget {

  @override
  ShopHomeState createState() {
    return ShopHomeState();
  }
}

class ShopHomeState extends State<ShopHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('SHOP'),
        ),
      ),
    );
  }

}