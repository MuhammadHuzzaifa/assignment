import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Models/prayers_models.dart';

class ApiPrayers extends StatefulWidget {
  const ApiPrayers({super.key});

  @override
  State<ApiPrayers> createState() => _ApiPrayersState();
}

class _ApiPrayersState extends State<ApiPrayers> {
  late PrayerModel list;
  static String city = 'havelian';
  static String country = 'pakistan';
  static int method = 2;

  Future<PrayerModel> getPrayerApi() async {
    final response = await http.get(Uri.parse(
        "http://api.aladhan.com/v1/timingsByCity?city=abbottabad&country=Pakistan&method=method=2"));
    var data = jsonDecode(response.body.toString());
    list = PrayerModel.fromJson(data);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('prayer_Time  Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPrayerApi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text('Fajr'),
                                Text('Dhuhr'),
                                Text('Asr'),
                                Text('Maghrib'),
                                Text('Isha'),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(snapshot.data.data.timings.fajr),
                                Text(snapshot.data.data.timings.dhuhr),
                                Text(snapshot.data.data.timings.asr),
                                Text(snapshot.data.data.timings.maghrib),
                                Text(snapshot.data.data.timings.isha),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Text(snapshot.data.data.meta.timezone),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
