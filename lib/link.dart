import 'package:flutter/material.dart';

class Link extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("link"),
              SizedBox(height: 30),
                RaisedButton(
                  onPressed: () => showLicensePage(context: context),
                  child: const Text(
                    'About Lisence',
                    style: TextStyle(fontSize: 20)
                  ),
                ),
            ]
          )
        ],
      )
    );
  }
}
