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
          showDialog(
            context: context,
            builder: (_) => FunkyOverlay(
              description: widget.description,
              supportedPlatform: widget.supporterdPlatform,
              programingLanguageUsed: widget.programingLanguageUsed,
              downloads: widget.downloads,
              usingTechnology: widget.usingTechnology,
            ),
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

  Widget expandedContent() {
    return Column(
      children: <Widget>[
        Text(widget.description),
        SizedBox(height: 20.0),
        Text(
          "Data of this app",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(widget.description),
        Text("Programing Languaged used" +
            "\n\n" +
            widget.programingLanguageUsed),
        Text("d")
      ],
    );
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

class FunkyOverlay extends StatefulWidget {
  FunkyOverlay(
      {Key key,
      this.description,
      this.supportedPlatform,
      this.programingLanguageUsed,
      this.downloads,
      this.usingTechnology})
      : super(key: key);

  final String usingTechnology;
  final String description;
  final String supportedPlatform;
  final String programingLanguageUsed;
  final int downloads;

  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInExpo);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0))),
            child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(widget.description),
                    SizedBox(height: 30.0),
                    Text(
                      "Data of this app",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Made with",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(widget.usingTechnology),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text("Supported Platform",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(widget.supportedPlatform),
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
                    Text(widget.programingLanguageUsed),
                    SizedBox(height: 10.0),
                    Text(
                      "Donwloads",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(widget.downloads == 0
                        ? "?"
                        : "over" + widget.downloads.toString()),
                    SizedBox(height: 10.0),
                    Text("Link", style: TextStyle(fontWeight: FontWeight.w600)),
                    SizedBox(height: 5.0),
                    Text("https://example.com")
                  ],
                ))),
          ),
        ),
      ),
    );
  }
}
