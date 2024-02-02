import 'package:hive/hive.dart';

part 'data_student.g.dart';

@HiveType(typeId: 0)
class DataStudent extends HiveObject {
  @HiveField(1)
  dynamic Key;
  @HiveField(2, defaultValue: "")
  String student_name = "";
  @HiveField(3, defaultValue: 1)
  int student_roll_no = 0;
  @HiveField(4, defaultValue: "1")
  String student_grade = "1";
}
