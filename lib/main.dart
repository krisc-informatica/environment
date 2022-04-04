import 'dart:convert';
import 'package:dio/dio.dart';
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
  late Map pollen;
  late Map air;

  @override
  void initState() {
    getAmbeePollenData();
    getAmbeeAirData();
    super.initState();
  }

  void getAmbeePollenData() async {
    var response = await Dio().get(
      'https://api.ambeedata.com/latest/pollen/by-place?place=Aachen,Germany',
      options: Options(
        headers: {
          'x-api-key':
              '84e67d5c77574be4c21463c86642328114f156c59338b2b145894e282b9f073e',
        },
      ),
    );
    setState(() {
      pollen = json.decode(response.toString());
      print(pollen);
    });
  }

  void getAmbeeAirData() async {
    var response = await Dio().get(
      'https://api.ambeedata.com/latest/by-city?city=Aachen,Germany',
      options: Options(
        headers: {
          'x-api-key':
              '84e67d5c77574be4c21463c86642328114f156c59338b2b145894e282b9f073e',
        },
      ),
    );
    setState(() {
      air = json.decode(response.toString());
      print(air);
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
                Text(pollen['data'][0]['Count']['tree_pollen'].toString()),
                Image.asset("assets/images/aqi_201.png"),
              ],
            ),
            Row(
              children: [
                const Text("CO"),
                const Spacer(),
                Text(air['stations'][0]['CO'].toString()),
                Image.asset("assets/images/aqi_101.png"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
