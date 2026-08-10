import "dart:io";
import "models/models.dart";
import 'services/school_service.dart';

void main() {
  SchoolClass.elevend();

  Student olzhas = inputStudent();
  print(olzhas);
  while (true) {
    print("""School Managing Application: 
    1. Get the students list
    2. Check the existence of Student
    3. Add the student to Class
    0. Exit""");

    int answer = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

    switch (answer) {
      case 1:
        SchoolClass sClass = requestSchoolClass();
        printStudentlist(sClass);
    }
  }
}
