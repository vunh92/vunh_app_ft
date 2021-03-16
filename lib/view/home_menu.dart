import 'package:flutter/material.dart';
import 'package:vunh_app_ft/models/home_menu_model.dart';

class HomeMenu extends StatefulWidget {
  @override
  HomeMenuState createState() {
    return HomeMenuState();
  }
}

class HomeMenuState extends State<HomeMenu> {
  List<HomeMenuItem> _homeMenuItem;

  @override
  void initState() {
    super.initState();
    _homeMenuItem = HomeMenuModel.homeMenuItemList;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _homeMenuItem.length,
      itemBuilder: (context, index) {
        bool row = index % 2 == 0;
        return drawRow(_homeMenuItem[index], row);
    },);
  }

  Widget drawRow(HomeMenuItem homeMenuItem, bool row) {
    return Container(
      color: row? Colors.white : Colors.black12,
      child: ListTile(
        leading: Icon(homeMenuItem.icon, color: Colors.deepPurple),
        title: Text(
          homeMenuItem.title,
          style: TextStyle(fontSize: 16, color: Colors.deepPurple),
        ),
      ),
    );
  }
}