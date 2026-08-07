import "dart:io";
import "models/models.dart";
import 'services/school_service.dart';

void main() {
  Person olzhas = inputPerson();

  while (true) {
    print("""School Managing Application: 
    1. Get the students list
    2. Check the existence of Student
    3. Add the student to Class
    0. Exit""");

    String? answer = stdin.readLineSync();
  }
}
