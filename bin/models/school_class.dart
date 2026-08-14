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

  bool isValidGDL() {
    int grade = int.parse(gradeDLiteral.split('.')[0]);
    int literalCode = (gradeDLiteral.split('.')[1].codeUnitAt(0));
    return (grade < 13 && grade > 0) &&
        (literalCode >= "a".codeUnitAt(0) && literalCode <= "z".codeUnitAt(0));
  }

  @override
  String toString() {
    return 'SchoolClass{gradeDLiteral: $gradeDLiteral, studentsList: $studentsList}';
  }
}
