import 'package:contact_tracer/model/Colors.dart';
import 'package:contact_tracer/widgets/ItemImage.dart';
import 'package:flutter/material.dart';
import 'package:contact_tracer/pages/DetailPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailPageBackground,
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  buildAppBar() {
    return AppBar(
      elevation: 0.1,
      backgroundColor: detailPageBackground,
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );
  }

  buildBody() {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return makeCard();
      },
    ));
  }

  makeCard() {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: makeListTile(),
      ),
    );
  }

  makeListTile() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage()));
      },
      child: Container(
        height: 160,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                child: ItemImage(url: 'https://blog.hubspot.com/hs-fs/hubfs/image8-2.jpg?width=600&name=image8-2.jpg'),
              ),
            ),
            Expanded(flex: 3,
              child: Container(
                child: Text("hello"),
              ),),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.orange,
                ))
          ],
        ),
      ),
    );

//    return ListTile(
//        onTap: () {
//          Navigator.of(context).push(MaterialPageRoute(
//              builder: (context) => DetailPage()));
//        },
//        contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//        leading: Container(
//          padding: EdgeInsets.only(right: 12.0),
//          decoration: new BoxDecoration(
//              border: new Border(
//                  right: new BorderSide(width: 1.0, color: Colors.white24))),
//          child: Icon(Icons.autorenew, color: Colors.white),
//        ),
//        title: Text(
//          "Company Name",
//          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//        ),
//        // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
//        subtitle: Row(
//          children: <Widget>[
//            Icon(Icons.linear_scale, color: Colors.yellowAccent),
//            Text(" Job Title", style: TextStyle(color: Colors.white))
//          ],
//        ),
//        trailing:
//            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
//    );
  }
}
