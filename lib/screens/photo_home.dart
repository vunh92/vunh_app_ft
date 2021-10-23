import 'dart:convert';
// import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:vunh_app_ft/models/photo_model.dart';
import 'package:vunh_app_ft/screens/home_screen/home_menu.dart';

class PhotoHome extends StatefulWidget {
  @override
  PhotoHomeState createState() {
    return PhotoHomeState();
  }

}

class PhotoHomeState extends State<PhotoHome> {
  String urlPhoto = 'https://jsonplaceholder.typicode.com/photos';
  Future<List<Photos>> photoFuture;

  @override
  void initState() {
    super.initState();
    photoFuture = fetchPhotos(http.Client());
  }

  Future<List<Photos>> fetchPhotos(http.Client client) async {
    final response = await client.get(urlPhoto);

    // Use the compute function to run parsePhotos in a separate isolate.
    // return compute(parsePhotos, response.body);
    if (response.statusCode == 200) {
      // If the call to the server was successful (returns OK), parse the JSON.
      return parsePhotos(response.body);
    } else {
      // If that call was not successful (response was unexpected), it throw an error.
      throw Exception('Failed to load post');
    }
  }

  // A function that converts a response body into a List<Photo>.
  List<Photos> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photos>((json) => Photos.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photos'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Photos>>(
        future: photoFuture,
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? PhotosList(photos: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
      drawer: Drawer(
        child: HomeMenu(),
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Photos> photos;

  PhotosList({Key key, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: photos.length,
      itemBuilder: (context, index) {
        return Image.network(photos[index].thumbnailUrl);
      },
    );
  }
}