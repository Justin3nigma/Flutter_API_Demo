import 'package:flutter/material.dart';
import 'package:reddit_client/data.dart';

class DetailView extends StatelessWidget {
  final Data data;
  DetailView({Key key, @required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Flutter API Demo'),
        ),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  FadeInImage(
                    placeholder: NetworkImage('https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg'),
                    image: new NetworkImage(data.thumbnailUrl),
                    fit: BoxFit.fitWidth,
                  ),

                  SizedBox(height: 20),

                  Text(
                    data.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    data.author,
                  ),
                ]
            )
        )
    );
  }
}