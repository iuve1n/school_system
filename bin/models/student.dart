import 'person.dart';

enum AttendanceStatus { present, late, absent, excused }

class Student extends Person {
  static Map<String, Student> database = {};
  late String school;
  late String gradeDLiteral;
  List<double> gradeList = [];
  Map<String, AttendanceStatus> attendance = {};

  Student(
    super.name,
    super.surName,
    super.formattedBirthday,
    super.id,
    this.school,
    this.gradeDLiteral,
    this.gradeList,
  ) {
    database[id] = this;
  }

  Student.binomStudent()
    : school = "Binom",
      gradeDLiteral = "11.d",
      gradeList = [4.0, 4.0, 4.0],
      super.eren() {
    database[id] = this;
  }

  double get gpa {
    if (gradeList.isEmpty) return 0.0;
    double sum = 0;
    for (double grade in gradeList) {
      sum += grade;
    }
    return sum / gradeList.length;
  }

  void markAttendance(String date, AttendanceStatus status) {
    attendance[date] = status;
  }

  @override
  String toString() {
    return '${super.toString()}, school: $school, gradeDLiteral: $gradeDLiteral, gradeList: $gradeList, gpa: $gpa';
  }
}
