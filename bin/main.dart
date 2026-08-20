import "dart:io";
import "models/models.dart";
import 'services/school_service.dart';

enum C {
  one("getting students list"),
  two("getting information about student"),
  three("adding the student to class"),
  four("creating student"),
  five("creating new class"),
  six("declaring new academic year"),
  seven("adding new attendance record for student"),
  eight("adding attendance record for whole class"),
  zero("EXIT -- data will be erased!");

  const C(this.text);
  final String text;
}

void main() {
  SchoolClass.elevend();
  Student.binomStudent();

  late String answer;
  mainloop:
  while (true) {
    do {
      print("""School Managing Application: 
    1. Get the students list.
    2. Get the information about student.
    3. Add the student to Class.
    4. Create a new Student.
    5. Create a new Class.
    6. New Academic Year(+1 for all grades).
    7. Mark attendance of the student.
    8. Mark attendance of the class.
    0. Exit.""");
      stdout.write("INPUT: ");
      answer = stdin.readLineSync() ?? "";
      if (answer.isEmpty) {
        print("Input can't be empty");
      }
    } while (answer.isEmpty);

    switch (answer) {
      case "1":
        if (!askForYON("Do you want to continue ${C.one.text}")) {
          continue;
        }
        final sClass = requestSchoolClass();
        printStudentlist(sClass);
        break;
      case "2":
        if (!askForYON("Do you want to continue ${C.two.text}")) {
          continue;
        }
        final student = requestStudent();
        print(student);
      case "3":
        if (!askForYON("Do you want to continue ${C.three.text}")) {
          continue;
        }
        addStudentToClass();
      case "4":
        if (!askForYON("Do you want to continue ${C.four.text}")) {
          continue;
        }
        createStudent();
      case "5":
        if (!askForYON("Do you want to continue ${C.five.text}")) {
          continue;
        }
        createSchoolClass();
      case "6":
        if (!askForYON("Do you want to continue ${C.six.text}")) {
          continue;
        }
        newAcademicYear();
      case "7":
        if (!askForYON("Do you want to continue ${C.seven.text}")) {
          continue;
        }
        markAttendanceOfStudent();
      case "8":
        if (!askForYON("Do you want to continue ${C.eight.text}")) {
          continue;
        }
        markAttendanceOfClass();

      case "0":
        if (!askForYON("Do you want to continue ${C.zero.text}")) {
          continue;
        }
        print("Exit...");
        break mainloop;
      default:
        print("INPUT doesnt suits to any of the given option");
    }

    print("\n \n \n ");
  }
}
