
import 'package:flutter/material.dart';

class HomeMenuModel {
  static List<HomeMenuItem> homeMenuItemList = [
    HomeMenuItem('My Profile', Icons.account_circle),
    HomeMenuItem('Notifications', Icons.notifications),
    HomeMenuItem('History', Icons.history),
    HomeMenuItem('Camera', Icons.add_a_photo),
    HomeMenuItem('Map', Icons.location_on),
    HomeMenuItem('Shop', Icons.add_shopping_cart),
  ];

}
class HomeMenuItem {
  String title;
  IconData icon;

  HomeMenuItem(this.title, this.icon);

}