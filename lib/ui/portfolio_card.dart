import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String githubLink;
  String webLink;
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
    this.githubLink,
    this.webLink,
    this.appStoreLink,
    this.playStoreLink,
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
                      githubLink: widget.githubLink,
                      webLink: widget.webLink,
                      playStoreLink: widget.playStoreLink,
                      appStoreLink: widget.appStoreLink,
                    )),
          );
        },
        child: Container(
            constraints: BoxConstraints(
                maxHeight:  MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.height / 1.5 :  MediaQuery.of(context).size.height / 2,
              ),
            child: Card(
                child: Column(children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 3),
                child: Image.asset(widget.thumbnailImagePath, fit: BoxFit.fill),
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
      this.githubLink,
      this.webLink,
      this.playStoreLink,
      this.appStoreLink,
      this.usingTechnology})
      : super(key: key);

  final String name;
  final String thumbnailImagePath;
  final String usingTechnology;
  final String description;
  final String supportedPlatform;
  final String programingLanguageUsed;
  final int downloads;
  final String githubLink;
  final String webLink;
  final String playStoreLink;
  final String appStoreLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Text(
          name,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: SingleChildScrollView(
              child: MediaQuery.of(context).size.width > 501
                  ? desktopDataWidget(context)
                  : mobileDetailsWidget(context))),
    );
  }

  Widget mobileDetailsWidget(context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 25.0),
          //popup left contents.
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: null,
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Image.asset(thumbnailImagePath),
                ),
                SizedBox(height: 30.0),
                Text(
                  description,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          //popup right contents.
          Container(
            width: MediaQuery.of(context).size.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Text(
                  "Data of this app",
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text("Title", style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text(name),
                const SizedBox(
                  height: 10.0,
                ),
                const Text("Made with",
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text(usingTechnology),
                const SizedBox(
                  height: 10.0,
                ),
                const Text("Supported Platform",
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
                Text(supportedPlatform),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Programing Languaged Used",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(programingLanguageUsed),
                const SizedBox(height: 10.0),
                const Text(
                  "Donwloads",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(downloads == 0 ? "?" : "over " + downloads.toString()),
                SizedBox(height: 10.0),
                const Text("Link", style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 5.0),
                generateLinksWidget(
                    githubLink, webLink, appStoreLink, playStoreLink),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          RaisedButton(
            child: const Text("Go back"),
            color: Colors.white,
            shape: const StadiumBorder(
              side: const BorderSide(color: Colors.black),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ]);
  }

  Widget generateLinksWidget(github, web, appstore, googleplay) {
    List<Widget> linkWidgets = [];
    List<String> urls = [github, web, appstore, googleplay];
    List<IconData> icons = [
      Fontisto.github,
      Entypo.network,
      Fontisto.app_store,
      Fontisto.google_play
    ];

    var index = 0;
    urls.forEach((element) {
      if (element.startsWith('http')) {
        linkWidgets.add(
          Padding(
            padding: EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
              launch(element);
              },
              child: Icon(icons[index]),
            )
          )
        );
      }
      index++;
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: linkWidgets
    );
  }

  Widget desktopDataWidget(context) {
    return Column(children: <Widget>[
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //popup left contents.
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 35.0),
                    child: SizedBox(
                      height: null,
                      width: MediaQuery.of(context).size.width / 2.0,
                      child: Image.asset(thumbnailImagePath),
                    ),
                  ),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            //popup right contents.
            Container(
              padding: EdgeInsets.symmetric(vertical: 35.0),
              width: MediaQuery.of(context).size.width / 3.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Data of this app",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text("Title", style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(name),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text("Made with",
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(usingTechnology),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text("Supported Platform",
                      style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5),
                  Text(supportedPlatform),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Programing Languaged Used",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(programingLanguageUsed),
                  const SizedBox(height: 10.0),
                  const Text(
                    "Donwloads",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(downloads == 0 ? "?" : "over " + downloads.toString()),
                  const SizedBox(height: 10.0),
                  const Text("Link", style: TextStyle(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 5.0),
                  generateLinksWidget(
                      githubLink, webLink, appStoreLink, playStoreLink),
                ],
              ),
            ),
          ]),
      const SizedBox(height: 20.0),
      RaisedButton(
        child: const Text("Go back"),
        color: Colors.white,
        shape: const StadiumBorder(
          side: const BorderSide(color: Colors.black),
        ),
        onPressed: () => Navigator.pop(context),
      ),
    ]);
  }
}
