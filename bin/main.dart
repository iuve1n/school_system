import "dart:io";
import "models/models.dart";
import 'services/school_service.dart';

void main() {
  SchoolClass.elevend();
  Student.binomStudent();

  late String answer;
  while (true) {
    do {
      print("""School Managing Application: 
    1. Get the students list.
    2. Get the information about student.
    3. Add the student to Class
    0. Exit""");
      stdout.write("INPUT: ");
      answer = stdin.readLineSync() ?? "";
      if (answer.isEmpty) {
        print("Input can't be empty");
      }
    } while (answer.isEmpty);

    switch (answer) {
      case "1":
        final sClass = requestSchoolClass();
        printStudentlist(sClass);
        break;
      case "2":
        final student = requestStudent();
        print(student);
      case "3":
        addStudentToClass();
      case "0":
        break;
      default:
        print("INPUT doesnt suits to any of the given option");
    }
  }
}
