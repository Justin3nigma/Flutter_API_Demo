import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'data.dart';
import 'side_menu.dart';
import 'custom_card.dart';
import 'design_data.dart';
import 'strings.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    ]
    );
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _url = 'https://www.reddit.com/r/all.json';
  List<Data> _notes = List<Data>();
  int _selectedIndex = 0;
  Future<Album> futureAlbum;

  Future<List<Data>> fetchNotes() async {
    List<Data> notes = List<Data>();
    var response = await http.get(_url);
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      var children = notesJson['data']['children'];
      for (var child in children) {
        notes.add(Data.fromJson(child));
      }
    } else {
      print('Fail to fetch Json.');
    }
    return notes;
  }



  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
      });
    });
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    return FutureBuilder<Album>(
      future: futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Color(snapshot.data.grey),
              appBar: AppBar(
                title: Text(Strings.FlutterAPIDemo),
                backgroundColor: Color(snapshot.data.color1),
              ),
              body: ListView(
                children: <Widget>[
                  Container(
                    height: 200,
                    color: Color(snapshot.data.grey),
                    child: Center(
                      child: FutureBuilder<Album>(
                        future: futureAlbum,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return FadeInImage(
                                placeholder: NetworkImage('https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg'),
                                image :NetworkImage(snapshot.data.image1),
                                fit: BoxFit.fitWidth,
                                width: MediaQuery.of(context).size.width * 1);
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(child: CustomCard(data: _notes[index]));
                    },
                    itemCount: _notes.length,
                  ),
                ],
              ),
              drawer: SideMenu(),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Color(snapshot.data.color2),
                currentIndex: _selectedIndex,
                selectedItemColor: Color(snapshot.data.color4),
                onTap: _onItemTapped, // this will be set when a new tab is tapped
                items: [
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.home),
                    title: new Text(Strings.Home)
                  ),
                  BottomNavigationBarItem(
                    icon: new Icon(Icons.mail),
                    title: new Text(Strings.Message)
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      title: Text(Strings.Profile)
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
