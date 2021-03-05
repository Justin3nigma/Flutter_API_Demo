import 'package:flutter/material.dart';
import 'package:reddit_client/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:reddit_client/design_data.dart';

void main(){
  runApp(new MaterialApp(
    home: new Splashscreen(),
  ));
}

class Splashscreen extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splashscreen> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new SplashScreen(
            seconds: 14,
            navigateAfterSeconds: new AfterSplash(),
            title: new Text('Welcome To Flutter API Demo',
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
              ),),
            image: new Image.network(snapshot.data.image1),
            backgroundColor: Color(snapshot.data.color3),
            styleTextUnderTheLoader: new TextStyle(color: Color(snapshot.data.black)),
            photoSize: 100.0,
            loaderColor: Color(snapshot.data.white),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}