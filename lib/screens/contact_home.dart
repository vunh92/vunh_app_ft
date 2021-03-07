import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:vunh_app_ft/models/contact_model.dart';

class ContactHome extends StatefulWidget {
  @override
  ContactHomeState createState() {
    return ContactHomeState();
  }

}

class ContactHomeState extends State<ContactHome> {
  String url = 'https://api.hubapi.com/contacts/v1/lists/all/contacts/all?hapikey=demo';
  String url2 = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<Contacts> contacts;

  @override
  void initState() {
    super.initState();
    // getContactList();
    contacts = getContacList();
  }

  Future<Contacts> getContacList() async{
    // var res = await http.get(url);
    final response  = await http.get(url2);
    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      return Contacts.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Contacts'),
        centerTitle: true,
      ),
      /*body: Column(
        children: <Widget>[
          Container(
            height: 100,
            color: Colors.blueGrey,
          ),
          Expanded(
            child:ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return contactDetail(index);
              },
            )
          ),
        ],
      ),*/
      body: Center(
        child: FutureBuilder(
          future: contacts,
          // ignore: missing_return
          builder: (context, item) {
            if(item.hasData){
              return Text('title : ' + item.data.title.toString());
            }else if(item.hasError) {
              return Text('${item.error}');
            }
            return CircularProgressIndicator();
        },),
      ),
    );
  }

  Widget contactDetail(int index) {
    return Container(
      color: index%2==0 ? Colors.blueAccent : Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child: Text('Name : '),
                ),
                Container(
                  child: Text('name + $index'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text('Phone : '),
                ),
                Container(
                  child: Text('phone + $index'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  child: Text('Address : '),
                ),
                Container(
                  child: Text('address + $index'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//https://api.hubapi.com/contacts/v1/lists/all/contacts/all?hapikey=demo&count=2