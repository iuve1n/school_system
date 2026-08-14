import 'student.dart';

class SchoolClass {
  static Map<String, SchoolClass> database = {};
  String gradeDLiteral;
  List<Student> studentsList;
  SchoolClass(this.studentsList, this.gradeDLiteral) {
    if (!isValidGDL()) {
      throw Exception("wrong format it should be (grade.literal)");
    }
    if (database.containsKey(gradeDLiteral)) {
      throw Exception("Class with that literal already exis");
    }
    for (Student student in studentsList) {
      student.gradeDLiteral = gradeDLiteral;
    }
    database[gradeDLiteral] = this;
  }

  SchoolClass.elevend()
    : gradeDLiteral = "11.d",
      studentsList = [
        Student.binomStudent(),
        Student.binomStudent(),
        Student.binomStudent(),
      ] {
    database[gradeDLiteral] = this;
  }

  void newAcademicYear() {
    database.remove(gradeDLiteral);
    List<String> list = gradeDLiteral.split(".");
    int grade = int.parse(list[0]);
    gradeDLiteral = "${++grade}.${list[1]}";
    for (Student student in studentsList) {
      student.gradeDLiteral = gradeDLiteral;
    }
    database[gradeDLiteral] = this;
  }

  bool isValidGDL() {
    List<String> list = gradeDLiteral.split(".");
    int grade = int.parse(list[0]);
    int literalCode = (gradeDLiteral.split('.')[1].codeUnitAt(0));
    return (grade < 13 && grade > 0) &&
        (literalCode >= "a".codeUnitAt(0) && literalCode <= "z".codeUnitAt(0));
  }

  static bool checkExistence(String key) {
    if (!(SchoolClass.database.containsKey(key))) {
      print("Class with the given gradeDotLiteral doesn't exist!");
      return false;
    }
    return true;
  }

  @override
  String toString() {
    return 'SchoolClass{gradeDLiteral: $gradeDLiteral, studentsList: $studentsList}';
  }
}
