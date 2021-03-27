
import 'package:flutter/material.dart';

class HomeMenuModel {
  static List<HomeMenuItem> homeMenuItemList = [
    HomeMenuItem('My Profile', 'myprofile', Icons.account_circle),
    HomeMenuItem('Notifications', 'notifications', Icons.notifications),
    HomeMenuItem('History', 'history', Icons.history),
    HomeMenuItem('Camera', 'camera', Icons.add_a_photo),
    HomeMenuItem('Map', 'map', Icons.location_on),
    HomeMenuItem('Shop', 'shop',Icons.add_shopping_cart),
  ];

}
class HomeMenuItem {
  String title;
  String menuID;
  IconData icon;

  HomeMenuItem(this.title, this.menuID, this.icon);

}