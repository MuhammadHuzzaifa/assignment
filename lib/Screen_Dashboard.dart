import 'package:assignment/data_apis/screen_dashboard_apis.dart';
import 'package:flutter/material.dart';

import 'data_hive/screen_dashbosrd-hive.dart';
import 'data_sqflit/screen_dasboard_sqflite.dart';

class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});
  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignvment Dashboard"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ApiPrayers()));
                },
                child: Text("PrayerTime DashBoard")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenDashboardsqflite()));
                },
                child: Text("SQFlite DashBoard")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => ScreenDashboardHive()));
                },
                child: Text("Hive DashBoard")),
          ],
        ),
      ),
    );
  }
}
