import 'package:flutter/material.dart';
import './ui/portfolio_card.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Works extends StatefulWidget {
  Works({Key key}) : super(key: key);

  @override
  _WorksState createState() => _WorksState();
}

class _WorksState extends State<Works> {
  var _portfolioCards = List<PortfolioCard>();

  @override
  void initState() {
    generateCards();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          _portfolioCards[0]
          //Text("hoge")
        ],
      ),
    );
  }

  void generateCards() {
    //ポートフォリオのデータを生成
    _portfolioCards.add(
      PortfolioCard(
          "ボイロとおバイク！",
          "Unity",
          10000,
          Fontisto.unity,
          "comment",
          "assets/images/icon.png",
          "desc",
          "imgPath/descpath",
          "C#",
          "Android/iOS",
          "google store link",
          "app store link"),
    );
  }
}

