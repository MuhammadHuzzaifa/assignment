import 'package:flutter/material.dart';

class ScreenAddRecord extends StatefulWidget {
  const ScreenAddRecord({super.key});

  @override
  State<ScreenAddRecord> createState() => _ScreenAddRecordState();
}

class _ScreenAddRecordState extends State<ScreenAddRecord> {
  var nameController = TextEditingController();
  var rollNoController = TextEditingController();
  var gradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add record"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "enter name"),
            ),
            TextFormField(
              controller: rollNoController,
              decoration: InputDecoration(hintText: "enter roll no"),
            ),
            TextFormField(
              controller: gradeController,
              decoration: InputDecoration(hintText: "enter grade"),
            ),
            SizedBox()
          ],
        ),
      ),
    );
  }
}
