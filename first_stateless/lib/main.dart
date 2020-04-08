import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Cars'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(this.title)),
      body: new ListView(
        children: <Widget>[
          CarWidget("BMW", "M3",
              "https://cars.usnews.com/static/images/Auto/izmo/i116773119/2019_bmw_m2_competition_angularfront.jpg"),
          CarWidget("Nissan", "GTR",
              "https://i.pinimg.com/originals/1f/c0/7c/1fc07c6b5550b31931214b874d63aa87.jpg"),
          CarWidget("Nissan", "Sentra",
              "https://car-data.com/clients/car-data/10-21-2010-11-56-25-PM-1370904.2011_sentra_01.jpg"),
        ],
      ),
    );
  }
}

class CarWidget extends StatelessWidget {
  CarWidget(this.make, this.model, this.imageSrc) : super();

  final String make;
  final String model;
  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all()),
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(children: <Widget>[
            Text(
              "$make $model",
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Image.network(imageSrc),
            ),
          ]),
        ),
      ),
    );
  }
}
