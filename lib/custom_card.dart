import 'package:flutter/material.dart';
import 'package:reddit_client/detail.dart';
import 'package:reddit_client/data.dart';

class CustomCard extends StatelessWidget {
  final Data data;
  const CustomCard({
    @required this.data,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailView(data: data))
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 16.0, right: 16.0
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                FadeInImage(
                  placeholder: NetworkImage('https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg'),
                  image: new NetworkImage(data.thumbnailUrl),
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 10),
                Text(
                  data.title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Container(
                    child:Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        data.author,
                        style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
                      ),)
                ),
              ]
          ),
        ),
      ),
    );
  }
}