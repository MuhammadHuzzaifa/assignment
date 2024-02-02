//import 'package:hive_app/database_hive/data_student.dart';
import 'package:assignment/data_hive/database/data_student.dart';
import 'package:hive_flutter/adapters.dart';

class DataBox {
  static const String data_student = "data_student";
  static Future<Box<DataStudent>> GetGeneral() async {
    return Hive.box(data_student);
  }

  static GetHiveFunction() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DataStudentAdapter());
    }
    if (!Hive.isBoxOpen(data_student)) {
      await Hive.openBox<DataStudent>(data_student);
    }
  }

  static Future<Box<DataStudent>> DataStudentBox() async {
    return Hive.box(data_student);
  }

  static Future<List<DataStudent>> GetDataStudentList() async {
    List<DataStudent> list = [];
    Box box_student = await DataStudentBox();
    list = box_student.values.toList().cast<DataStudent>();
    return list;
  }

  static AddRecord(DataStudent dataStudent) async {
    Box box_student = await DataStudentBox();
    List<DataStudent> list_records =
        box_student.values.toList().cast<DataStudent>();
    List<dynamic> list_keys = box_student.keys.toList().cast<dynamic>();
    box_student.put(list_keys[2], list_records[2]);
    box_student.add(dataStudent);
  }

  static String getNewkey() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  static TypeAdapter DataStudentAdapter() {}
}
