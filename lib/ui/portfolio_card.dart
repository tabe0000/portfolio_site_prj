import 'package:flutter/material.dart';

class PortfolioCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset("hoge/fuga.png"),
          Container(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text("title"),
              leading: Icon(Icons.person),
              subtitle: Text("subtitle")
            )
          )
        ]
      )
    );
  }
}