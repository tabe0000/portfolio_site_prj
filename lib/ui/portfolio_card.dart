import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class PortfolioCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Card(
        child: Column(children: <Widget>[
      Image.asset(thumbnailImagePath),
      Container(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
              title: Text(name),
              leading: Icon(iconData),
              subtitle: Text(usingTechnology + " / " + programingLanguageUsed)))
    ]));
  }
}

enum WorksTech {
  ALL,
  MOBILE,
  IOT,
  WEB,
}