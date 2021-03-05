import 'package:flutter/material.dart';
import 'package:reddit_client/strings.dart';
import 'homepage.dart';
import 'design_data.dart';

void main(){
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  String nEmail = "";
  String nPassword = "";
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
          return Scaffold(
            backgroundColor: Color(snapshot.data.grey),
            body: Builder(
              builder:(context)=> SafeArea(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 90.0,),
                        Center(
                            child: FadeInImage(placeholder:
                            NetworkImage('https://www.thermaxglobal.com/wp-content/uploads/2020/05/image-not-found.jpg'),
                                image :NetworkImage(snapshot.data.image1))
                        ),

                        SizedBox(height: 10.0,),

                        Center(
                            child: Text(Strings.Demo,
                              style: TextStyle(
                                fontSize: 30.0,
                                letterSpacing: 5.0,
                                fontWeight: FontWeight.bold,
                                color: Color(snapshot.data.color2),
                              ),
                            )
                        ),
                      ],
                    ),
                    SizedBox(height: 100.0,),

                    Form(
                      key: _formkey,
                      child: Column(
                        children:<Widget>[
                          TextFormField(
                            controller: etEmail,
                            decoration: InputDecoration(
                                labelText: Strings.EmailAddress,
                                icon: const Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: const Icon(Icons.mail))
                            ),
                            validator: (value){
                              if (value.isEmpty){
                                return Strings.EnterEmail;
                              }
                              else if(!isEmail(value)){
                                return Strings.EmailNotValid;
                              }
                              else {
                                nEmail = value;
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller: etPassword,
                            decoration: InputDecoration(
                                labelText: Strings.PassWord,
                                icon: const Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: const Icon(Icons.lock),
                                )
                            ),
                            validator: (value){
                              if (value.isEmpty){
                                return Strings.EnterPassword;
                              }
                              else {
                                return null;
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 80.0,),
                    Column(
                      children: <Widget>[
                        ButtonTheme(
                          height: 50,
                          buttonColor:  Color(snapshot.data.color1),
                          disabledColor: Color(snapshot.data.color1),
                          child: RaisedButton(
                            disabledElevation: 4.0,
                            onPressed:(){
                              //print();
                              if(_formkey.currentState.validate()) {
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (context) => MyApp()
                                ));
                              }
                            },
                            child: Text(Strings.Login,
                                style: TextStyle(
                                  fontSize: 20,
                                  color:  Color(snapshot.data.white),
                                )),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
bool isEmail(String em) {
  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

