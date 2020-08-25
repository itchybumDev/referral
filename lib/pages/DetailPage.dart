import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contact_tracer/model/Colors.dart';
import 'package:contact_tracer/widgets/ItemImage.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: detailPageBackground,
      body: buildBody(context),
      bottomNavigationBar: buildBottomBar(context),
    );
  }

  buildBottomBar(context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: detailPageBackground,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              margin: EdgeInsets.only(right: 5, left: 10),
              height: 60,
              child: Icon(Icons.bookmark, color: Colors.grey[600],),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10, left: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: buttonColor,
                ),
                height: 60,
                child: Text(
                  "Request",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Colors.white),
                )),
          )
        ],
      ),
    );
  }

  buildBody(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ...buildPostingInfo(context),
          Container(height: 30),
          ...buildDescription(context),
        ],
      ),
    );
  }

  buildDescription(context) {
    return [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          alignment: Alignment.center,
          child: Text(
            'Description',
            style: Theme.of(context).textTheme.headline5,
          )),
      Container(height: 15),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
            'Boisterous he on understood attachment as entreaties ye devonshire. In mile an form snug were been sell. Hastened admitted joy nor absolute gay its. Extremely ham any his departure for contained curiosity defective. Way now instrument had eat diminution melancholy expression sentiments stimulated. One built fat you out manor books. Mrs interested now his affronting inquietude contrasted cultivated. Lasting showing expense greater on colonel no.',
            style: Theme.of(context).textTheme.bodyText2),
      )
    ];
  }

  buildPostingInfo(context) {
    return [
      Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Column(children: <Widget>[
            Container(
              height: 200,
              child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 300.0,
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                  imageUrl:
                      'https://www.smartrecruiters.com/wp-content/themes/smartrecruiters/new-template/img/en_us/glossary/glossary-catthumb-hiring-tips.png',
                  placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: detailPageBackground,
                        ),
                      ),
                  errorWidget: (context, url, error) => Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10.0),
                          color: detailPageBackground,
                        ),
                      )),
            ),
            Container(
              height: 40,
            ),
          ]),
          Positioned(
            left: 0,
            top: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child:
                    IconButton(icon: Icon(Icons.arrow_back, color: Colors.black)),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
              child: IconButton(icon: Icon(Icons.share, color: Colors.black)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              alignment: Alignment.center,
              height: 80,
              width: 80,
              child: ItemImage(url: 'https://blog.hubspot.com/hs-fs/hubfs/image8-2.jpg?width=600&name=image8-2.jpg'),
            ),
          )
        ],
      ),
      Container(
        child: Text('Sr. Software Engineer',
            style: Theme.of(context).textTheme.headline4),
      ),
      Container(
        child: Text('Singapore', style: Theme.of(context).textTheme.bodyText2),
      ),
    ];
  }
}
