import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get('http://www.json-generator.com/api/json/get/bUPgrvGBiW?indent=2');

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final String image1;
  final String image2;
  final int color1;
  final int color2;
  final int color3;
  final int color4;
  final int color5;
  final int black;
  final int white;
  final int grey;

  Album({this.image1,this.image2, this.color1, this.color2, this.color3,this.color4,this.color5,this.black,this.white,this.grey});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        image1: json['image1'],
        image2: json['image2'],
        color1: json['color1'],
        color2: json['color2'],
        color3: json['color3'],
        color4: json['color4'],
        color5: json['color5'],
        black: json['black'],
        white: json['white'],
        grey: json['grey']
    );
  }
}

void main() => runApp(MyAppe());

class MyAppe extends StatefulWidget {
  MyAppe({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppe> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FadeInImage(placeholder:
                NetworkImage('https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg'),
                    image :NetworkImage(snapshot.data.image1));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }


}
