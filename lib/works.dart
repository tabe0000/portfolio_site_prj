import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';


class Works extends StatefulWidget {
  Works({Key key}) : super(key: key);

  @override
  _WorksState createState() => _WorksState();
}

class _WorksState extends State<Works> {
     var _placeList = new List<PlaceItem>();

  @override
  void initState() {
    _placeList.add(
      PlaceItem(false, 'Mobile', 'images/icon.png', Fontisto.mobile_alt),
    );
    _placeList.add(
      PlaceItem(false, 'IoT', 'images/icon.png', Entypo.network),
    );
    _placeList.add(
      PlaceItem(false, 'Robot', 'images/icon.png', MaterialCommunityIcons.robot),
    );
    _placeList.add(
      PlaceItem(false, 'PC', 'images/icon.png', FontAwesome.laptop),
    );    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Container(
        padding: EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _placeList[index].isExpanded = !_placeList[index].isExpanded;
                });
              },
              children: _placeList.map(_createPanel).toList(),
            )
          ],
        ),
      );
  }
}


class PlaceItem {
  bool isExpanded;
  String name;
  String image;
  IconData icon;
  PlaceItem(this.isExpanded, this.name, this.image, this.icon);
}

ExpansionPanel _createPanel(PlaceItem place) {
  return ExpansionPanel(
    headerBuilder: (BuildContext context, bool isExpanded) {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(place.icon),
            ),
            Text(
              place.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );
    },
    body: Image.asset('assets/' + place.image),
    isExpanded: place.isExpanded,
  );
}



