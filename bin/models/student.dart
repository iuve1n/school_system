import 'person.dart';

class Student extends Person {
  late String school;
  late String schoolClassGradeLiteral;
  List<double> gradeList = [];
  late double gpa;

  Student(
    String name,
    String surName,
    int birthD,
    int birthM,
    int birthY,
    this.school,
    this.schoolClassGradeLiteral,
    this.gradeList,
  ) : super(name, surName, birthD, birthM, birthY) {
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
