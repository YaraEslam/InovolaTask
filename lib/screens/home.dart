import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:inovola_task/presenter/itemPresenter.dart';

import '../network/model/item_model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> implements ItemListViewContract {
  ItemListPresenter _presenter;
  Item item;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _presenter.loadItem();
  }

  _HomeState() {
    _presenter = new ItemListPresenter(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            _isLoading ? Center(child: RefreshProgressIndicator()) : _screen());
  }

  _screen() {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            Container(
              child: SizedBox(
                height: 200.0,
                width: MediaQuery.of(context).size.width, //300.0,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  autoplay: false,
                  animationCurve: Curves.fastOutSlowIn,
                  animationDuration: Duration(milliseconds: 1000),
                  dotSize: 6.0,
                  dotIncreasedColor: Colors.white, //Color(0xFFFF335C),
                  dotBgColor: Colors.transparent,
                  dotPosition: DotPosition.bottomLeft,
                  dotSpacing: 10.0,
                  dotVerticalPadding: 5.0,
                  showIndicator: true,
                  indicatorBgPadding: 7.0,
                  images: [
                    NetworkImage(item.img[0]),
                    NetworkImage(item.img[1]),
                    NetworkImage(item.img[2]),
                    NetworkImage(item.img[3]),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "# ${item.interest}",
                style: TextStyle(fontSize: 15.0, color: Colors.grey),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                "${item.title}",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _textIcon(Icons.calendar_today, item.date),
            _textIcon(Icons.location_on, item.address),
            new Divider(
              height: 2.0,
              color: Colors.grey,
            ),
            _imageText(),
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                "${item.trainerInfo}",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            new Divider(
              height: 2.0,
              color: Colors.grey,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                "OccasionDetail",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                "${item.occasionDetail}",
                style: TextStyle(fontSize: 15.0, color: Colors.black),
              ),
            ),
            new Divider(
              height: 2.0,
              color: Colors.grey,
            ),
            Container(
              padding:
                  EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 8.0),
              child: Text(
                "Price",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            _price("الحجز العادى"),
            _price("الحجز المميز"),
            _price("الحجز السريع"),
            Container(
              height: 50,
              color: Colors.deepPurple,
              child: InkWell(
                  onTap: () {
                    Fluttertoast.showToast(msg: "OK");
                  },
                  child: Center(
                    child: Text(
                      "قم بالحجز الآن",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            )
          ],
        ),
        new Positioned(
          top: 0.0,
          left: 4.0,
          right: 0.0,
          child: AppBar(
            actions: <Widget>[
              Padding(
                child: Icon(
                  Icons.share,
                  size: 20.0,
                ),
                padding: EdgeInsets.only(left: 8.0),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Icon(
                  Icons.star_border,
                  size: 20.0,
                ),
              ),
            ],
            leading: Icon(
              Icons.arrow_back_ios,
              size: 20.0,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
        ),
      ],
    );
  }

  _textIcon(IconData icon, String data) {
    return Row(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 4.0, right: 8.0, bottom: 4.0),
          child: new Icon(
            icon,
            size: 20.0,
          ),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 4.0),
          child: Text(
            data,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        )
      ],
    );
  }

  _imageText() {
    return Row(
      children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(top: 8.0, left: 4.0, right: 8.0, bottom: 4.0),
          child: new CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(item.img[3]),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 8.0, bottom: 4.0),
          child: Text(
            "${item.trainerName}",
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  _price(String reserve) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                reserve,
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
            padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SAR ${item.price}",
                style: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  void onLoadItemComplete(Item items) {
    setState(() {
      item = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadItemError() {}
}
