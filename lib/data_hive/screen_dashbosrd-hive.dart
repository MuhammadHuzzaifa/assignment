import 'package:assignment/data_hive/database/data_box.dart';
import 'package:assignment/data_hive/screen_add_record.dart';
import 'package:flutter/material.dart';

class ScreenDashboardHive extends StatefulWidget {
  const ScreenDashboardHive({super.key});

  @override
  State<ScreenDashboardHive> createState() => _ScreenDashboardHiveState();
}

class _ScreenDashboardHiveState extends State<ScreenDashboardHive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ScreenAddRecord()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: InkWell(
            onTap: () {
              print("${DataBox.getNewkey()}");
            },
            child: Text("Dashboard")),
      ),
    );
  }
}
