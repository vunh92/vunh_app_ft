import 'package:flutter/material.dart';
import 'package:vunh_app_ft/models/home_menu_model.dart';
import 'package:vunh_app_ft/screens/contact_home.dart';
import 'package:vunh_app_ft/screens/shop_home.dart';

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

    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        drawerHeader(),
        ListTile(
          title: Text('My Profile'),
          leading: FlutterLogo(),
          onTap: () {
            // Update the state of the app.
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("My Profile!", textAlign: TextAlign.center,), duration: Duration(seconds: 4), ));
            Navigator.pop(context);
          },
        ),
        ListTile(
          tileColor: Colors.black12,
          leading: Icon(Icons.shopping_bag_sharp, color: Colors.deepPurpleAccent,),
          title: Text('Shop'),
          onTap: () {
            // Update the state of the app.
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Shop!", textAlign: TextAlign.center,), duration: Duration(seconds: 4), ));
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ShopHome(),));
          },
        ),
        ListTile(
          title: Text('Contact'),
          leading: Icon(Icons.contacts, color: Colors.deepPurpleAccent,),
          onTap: () {
            // Update the state of the app.
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Contact!", textAlign: TextAlign.center,), duration: Duration(seconds: 4), ));
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactHome(),));
          },
        ),
        ListTile(
          tileColor: Colors.black12,
          title: Text('Map'),
          leading: Icon(Icons.map_outlined, color: Colors.deepPurpleAccent,),
          onTap: () {
            // Update the state of the app.
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Map!", textAlign: TextAlign.center,), duration: Duration(seconds: 4), ));
            Navigator.pop(context);
          },
        ),
      ],
    );
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
        // onTap: ,
      ),
    );
  }

  Widget drawerHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  // child: Image.asset('hu_hon_002.PNG', height: 100, ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('hu_hon_002.PNG', height: 100, ),
                  )
                ),
                Text('Name: '),
                Text('Vunh')
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Drawer Header'),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blue,)
    );
  }
}