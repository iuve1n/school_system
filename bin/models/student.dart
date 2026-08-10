import 'person.dart';

class Student extends Person {
  static Map<String, Student> database = {};
  late String school;
  late String schoolClassGradeLiteral;
  List<double> gradeList = [];
  late double gpa;

  Student(
    super.name,
    super.surName,
    super.formattedBirthday,
    super.id,
    this.school,
    this.schoolClassGradeLiteral,
    this.gradeList,
  ) {
    database[id] = this;
    gpa = getGpa();
  }

  Student.binomStudent()
    : school = "Binom",
      schoolClassGradeLiteral = "1A",
      gradeList = [4.0, 4.0, 4.0],
      super.eren() {
    gpa = getGpa();
  }

  double getGpa() {
    if (gradeList.isEmpty) return 0;
    double sum = 0;
    for (double grade in gradeList) {
      sum += grade;
    }
    return sum / gradeList.length;
  }

  @override
  String toString() {
    return 'Student{school: $school, schoolClassGradeLiteral: $schoolClassGradeLiteral, gradeList: $gradeList, gpa: $gpa}';
  }
}
