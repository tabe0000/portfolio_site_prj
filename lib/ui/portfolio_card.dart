import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PortfolioCard extends StatefulWidget {
  //common property
  String name;
  String usingTechnology;
  int downloads;
  IconData iconData;

  //normal card.
  String comment;
  String thumbnailImagePath;

  //expanded card.
  String description;
  String descriptionImagePath;
  String programingLanguageUsed;
  String supporterdPlatform;
  String playStoreLink;
  String appStoreLink;

  //meta
  WorksTech worksTech;

  PortfolioCard(
    this.name,
    this.usingTechnology,
    this.downloads,
    this.iconData,
    this.comment,
    this.thumbnailImagePath,
    this.description,
    this.descriptionImagePath,
    this.programingLanguageUsed,
    this.supporterdPlatform,
    this.playStoreLink,
    this.appStoreLink,
    this.worksTech,
  );

  @override
  _PortfolioCardState createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => Details(
                      name: widget.name,
                      thumbnailImagePath: widget.thumbnailImagePath,
                      description: widget.description,
                      supportedPlatform: widget.supporterdPlatform,
                      programingLanguageUsed: widget.programingLanguageUsed,
                      downloads: widget.downloads,
                      usingTechnology: widget.usingTechnology,
                    )),
          );
        },
        child: Container(
            child: Card(
                child: Column(children: <Widget>[
          Container(
            child: Image.asset(widget.thumbnailImagePath),
          ),
          Container(
              child: Column(children: <Widget>[
            ListTile(
                title: Text(widget.name),
                leading: Icon(widget.iconData),
                subtitle: Text(widget.usingTechnology +
                    " / " +
                    widget.programingLanguageUsed)),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              width: double.infinity,
              child: Text(
                widget.comment,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.4),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ]))
        ]))));
  }
}

enum WorksTech {
  ALL,
  MOBILE,
  WEB,
  IOT,
  BOT,
  VISUAL_ART,
}

class Details extends StatelessWidget {
  Details(
      {Key key,
      this.name,
      this.thumbnailImagePath,
      this.description,
      this.supportedPlatform,
      this.programingLanguageUsed,
      this.downloads,
      this.usingTechnology})
      : super(key: key);

  final String name;
  final String thumbnailImagePath;
  final String usingTechnology;
  final String description;
  final String supportedPlatform;
  final String programingLanguageUsed;
  final int downloads;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
              child: Wrap(
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: <Widget>[
                //popup left contents.
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: null,
                      width: MediaQuery.of(context).size.width / 2.0,
                      child: Image.asset(thumbnailImagePath),
                    ),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                //popup right contents.
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Data of this app",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Title",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(name),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Made with",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(usingTechnology),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Supported Platform",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(supportedPlatform),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Programing Languaged used",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(programingLanguageUsed),
                    SizedBox(height: 10.0),
                    Text(
                      "Donwloads",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(downloads == 0 ? "?" : "over " + downloads.toString()),
                    SizedBox(height: 10.0),
                    Text("Link", style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 5.0),
                    Text("https://example.com")
                  ],
                ),
                Spacer(),
              ]))),
    );
  }
}
