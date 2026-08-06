import 'person.dart';

class Student extends Person {
  late String school;
  late String schoolClassGradeLiteral;
  List<double> gradeList = [];
  late double gpa;

  Student(
    super.name,
    super.surName,
    super.formattedBirthday,
    this.school,
    this.schoolClassGradeLiteral,
    this.gradeList,
  ) {
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
    double sum = 0;
    for (double grade in gradeList) {
      sum += grade;
    }
    return sum / gradeList.length;
  }
}
