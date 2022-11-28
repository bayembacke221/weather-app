import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/Networking/Services.dart';

import '../models/CityWeather.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Open Weather Map',),
        brightness: Brightness.light,
        backgroundColor: Color.fromRGBO(61, 90, 254, 1.0),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
              color: Color.fromRGBO(61, 90, 254, 1.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Colors for gradients
                  Color.fromRGBO(31, 42, 255, 1.0),
                  Color.fromRGBO(230, 60, 167, 1.0),
                ],
              )
          ),
          child: FutureBuilder<CityWeather>(
              future: Services.getCoordinate(14.7645042,-17.3660286),
              builder: (context,snapshot) {
                if(snapshot.hasData){
                  CityWeather cityWeather = snapshot.data!;
                  var fm = new DateFormat('MMMM dd, yyyy');

                  print(cityWeather.weatherList[0].icon);

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(0),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              Image.asset(
                                'assets/images/weather/${cityWeather.weatherList[0].icon}.png',
                                width: 100,
                                fit: BoxFit.fitWidth,
                              ),
                              Text(
                                '${cityWeather.mains.temp}°C',
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                '${cityWeather.name}',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                '${cityWeather.mains.temp_max}/${cityWeather.mains.temp_min}',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.white70,
                                ),
                              ),
                              Text(
                                '${cityWeather.weatherList[0].description}'.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontFamily: 'Roboto',
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            height: 400,
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(30.0),
                                  topRight: const Radius.circular(30.0)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Text(
                                      'Aujourd\'hui',
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          height: 1,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color:
                                          Color.fromRGBO(0, 33, 255, 1.0)),
                                    ),
                                    new Text(
                                      '${fm.format(new
                                      DateTime.fromMillisecondsSinceEpoch((cityWeather.dt * 1000), isUtc: true))}',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        height: 1,
                                        letterSpacing: 0.25,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(0, 33, 255, 1.0),
                                      ),
                                    ),
                                  ],
                                ),
                                new Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    new Text(
                                      '',
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          height: 1.5,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5,
                                          color:
                                          Color.fromRGBO(31, 42, 255, 1.0)),
                                    ),
                                  ],
                                ),
                                new Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: SizedBox(
                                        height: 150,
                                        child: new ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(20),
                                              width: 160.0,
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                color: Colors.white,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 1.0,
                                                  )
                                                ],
                                              ),
                                              child: new Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.wb_sunny,
                                                    color: Colors.orange,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    'Feels like',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.5,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cityWeather.mains.temp}°C',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.0,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(20),
                                              width: 160.0,
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                color: Colors.white,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 1.0,
                                                  )
                                                ],
                                              ),
                                              child: new Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.toys,
                                                    color: Colors.blueGrey,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    'Vent',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.5,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cityWeather.wind.speed} m/s',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.0,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.all(5),
                                              padding: EdgeInsets.all(20),
                                              width: 160.0,
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                color: Colors.white,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 1.0,
                                                  )
                                                ],
                                              ),
                                              child: new Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.opacity,
                                                    color: Colors.blueAccent,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    'Humidite',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.5,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cityWeather.mains.humidity} %',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.0,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(20),
                                              margin: EdgeInsets.all(5),
                                              width: 160.0,
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                color: Colors.white,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 1.0,
                                                  )
                                                ],
                                              ),
                                              child: new Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.arrow_downward,
                                                    color: Colors.redAccent,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    'Pression',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.5,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cityWeather.mains.pressure} hPa',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.0,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(20),
                                              margin: EdgeInsets.all(5),
                                              width: 160.0,
                                              decoration: new BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(12),
                                                color: Colors.white,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.grey,
                                                    blurRadius: 1.0,
                                                  )
                                                ],
                                              ),
                                              child: new Column(
                                                mainAxisAlignment:
                                                MainAxisAlignment.start,
                                                children: <Widget>[
                                                  new Icon(
                                                    Icons.visibility,
                                                    color: Colors.black54,
                                                    size: 40,
                                                  ),
                                                  Text(
                                                    'Visibilite',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.5,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.bold,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                  Text(
                                                    '${cityWeather.visibility / 1000} km',
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                      height: 1.0,
                                                      letterSpacing: 0.25,
                                                      fontWeight:
                                                      FontWeight.normal,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                new Column(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.all(20),
                                      margin: EdgeInsets.all(5),
                                      width: double.infinity,
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 1.0,
                                          )
                                        ],
                                      ),
                                      child: new Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: <Widget>[
                                          new Icon(
                                            Icons.cloud,
                                            color: Colors.black54,
                                            size: 40,
                                          ),
                                          Text(
                                            'Clouds',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              height: 1.5,
                                              letterSpacing: 0.25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Montserrat',
                                            ),
                                          ),
                                          Text(
                                            '${cityWeather.clouds.all} %',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              height: 1.0,
                                              letterSpacing: 0.25,
                                              fontWeight: FontWeight.normal,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError){
                  return Container(
                    height: 500,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/bug_fixed.png',
                          width: 250,
                          fit: BoxFit.fitWidth,
                        ),
                        Text(
                          ' ',
                          style: TextStyle(
                            height: 1.5,
                          ),
                        ),
                        Text(
                          'Oh Oh, Houston we have a problem!',
                          style: TextStyle(
                              fontSize: 20.0,
                              height: 1.0,
                              letterSpacing: 0.25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          ' ',
                          style: TextStyle(
                            height: 1.0,
                          ),
                        ),
                        Text(
                          'Check your network or give the location permission to the app.',
                          style: TextStyle(
                              fontSize: 15.0,
                              height: 1.0,
                              letterSpacing: 0.25,
                              fontWeight: FontWeight.normal,
                              color: Colors.white),
                        ),

                      ],
                    ),
                  );
                }else{

                  return CircularProgressIndicator();
                }

              },
          ),
        ),
      ),
    );
  }
}

