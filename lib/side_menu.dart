import 'package:flutter/material.dart';
import 'strings.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  Text(Strings.Email),
                ],
              ),
            ),
            ListTile(
              title: Text(Strings.Home),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(Strings.HelpFeedback ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(Strings.TermsOfService),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
    );
  }
}