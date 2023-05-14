import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:environment/model/air_quality.dart';
import 'package:environment/model/pollen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FHAir',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'FHAachen Air Quality'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Pollen? pollen;
  AirQuality? air;

  @override
  void initState() {
    getAmbeePollenData();
    getAmbeeAirData();
    super.initState();
  }

  void getAmbeePollenData() async {
    Response<dynamic> response = await Dio().get(
      'https://api.ambeedata.com/latest/pollen/by-place?place=Aachen,Germany',
      options: Options(
        headers: {
          'x-api-key':
              '14f758b0ca160e84fb249abaee682fcfd9b59e3ca4a2aa54f1e059987fde6c3f',
          'Content-type': 'application/json',
          // 'Authorization': 'Bearer 04d1368a451c32118df0b99c0f41629c'
        },
      ),
    );
    if (kDebugMode) {
      print(response.toString());
    }
    setState(() {
      // pollen = json.decode(response.toString());
      var json = jsonDecode(response.toString());
      pollen = Pollen.fromJson(json['data'][0]);
      if (kDebugMode) {
        print(pollen);
      }
    });
  }

  void getAmbeeAirData() async {
    var response = await Dio().get(
      'https://api.ambeedata.com/latest/by-city?city=Bocholt, Belgium',
      options: Options(
        headers: {
          'x-api-key':
              '14f758b0ca160e84fb249abaee682fcfd9b59e3ca4a2aa54f1e059987fde6c3f',
          'Content-type': 'application/json'
        },
      ),
    );
    if (kDebugMode) {
      print(response.toString());
    }
    setState(() {
      // air = json.decode(response.toString());
      var json = jsonDecode(response.toString());
      air = AirQuality.fromJson(json['stations'][0]);
      if (kDebugMode) {
        print(air);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Aachen',
              style: TextStyle(color: Colors.amber, fontSize: 26),
            ),
            Row(
              children: [
                const Text("Pollen"),
                const Spacer(),
                pollen != null
                    ? Text(pollen.toString())
                    : const Text('No Pollen data yet'),
                Image.asset("assets/images/aqi_201.png"),
              ],
            ),
            Row(
              children: [
                const Text("CO"),
                const Spacer(),
                air != null
                    ? Text(air.toString())
                    : const Text('No AirQuality data yet'),
                Image.asset("assets/images/aqi_101.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
