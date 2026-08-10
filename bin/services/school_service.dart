import 'dart:io';
import '../models/models.dart';

Person inputPerson() {
  stdout.write("Input the name: ");
  final name = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Surname: ");
  final surName = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Birthday(dd.mm.yyyy): ");
  final formattedBirthday = stdin.readLineSync() ?? "0.0.0";

  late String id;
  do {
    stdout.write("Input the id(yymmdd******): ");
    id = stdin.readLineSync() ?? "";
  } while (id.isEmpty);

  return Person(name, surName, formattedBirthday, id);
}

void createPerson() {
  stdout.write("Input the name: ");
  final name = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Surname: ");
  final surName = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Birthday(dd.mm.yyyy): ");
  final formattedBirthday = stdin.readLineSync() ?? "0.0.0";

  late String id;
  do {
    stdout.write("Input the id(yymmdd******): ");
    id = stdin.readLineSync() ?? "";
  } while (id.isEmpty);

  Person(name, surName, formattedBirthday, id);
  print("The Person with id: $id succesfully created");
}

Student inputStudent() {
  stdout.write("Input the name: ");
  final name = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Surname: ");
  final surName = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Birthday(dd.mm.yyyy): ");
  final formattedBirthday = stdin.readLineSync() ?? "Empty input";

  late String id;
  do {
    stdout.write("Input the id(yymmdd******): ");
    id = stdin.readLineSync() ?? "";
  } while (id.isEmpty);

  stdout.write("Input the school name: ");
  final school = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Grade dot Literal(11.d): ");
  final scgl = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the amount of graded subjects: ");
  final gradedSubjects = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  List<double> gradeList = [];
  for (int i = 0; i < gradedSubjects; i++) {
    print("IF THE INPUT WILL BE INVALID IT WILL BE COUNTED AS 0");
    stdout.write("${i + 1} Write the grade: ");
    gradeList.add(double.tryParse(stdin.readLineSync() ?? "0.0") ?? 0.0);
  }
  return Student(name, surName, formattedBirthday, id, school, scgl, gradeList);
}

void createStudent() {
  stdout.write("Input the name: ");
  final name = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Surname: ");
  final surName = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Birthday(dd.mm.yyyy): ");
  final formattedBirthday = stdin.readLineSync() ?? "Empty input";

  late String id;
  do {
    stdout.write("Input the id(yymmdd******): ");
    id = stdin.readLineSync() ?? "";
  } while (id.isEmpty);

  stdout.write("Input the school name: ");
  final school = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Grade dot Literal(11.d): ");
  final scgl = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the amount of graded subjects: ");
  final gradedSubjects = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

  List<double> gradeList = [];
  for (int i = 0; i < gradedSubjects; i++) {
    print("IF THE INPUT WILL BE INVALID IT WILL BE COUNTED AS 0");
    stdout.write("${i + 1} Write the grade: ");
    gradeList.add(double.tryParse(stdin.readLineSync() ?? "0.0") ?? 0.0);
  }

  Student(name, surName, formattedBirthday, id, school, scgl, gradeList);
  print("The Student with id: $id succesfully created");
}

String requestSchoolClassKey() {
  late String gradeDLiteral;
  do {
    stdout.write("Write the requested class(example 11.d): ");
    gradeDLiteral = stdin.readLineSync() ?? "";
  } while (gradeDLiteral.isEmpty);
  if (!(SchoolClass.database.containsKey(gradeDLiteral))) {
    throw Exception("That class doesn't exist");
  }
  return gradeDLiteral;
}

SchoolClass requestSchoolClass() {
  late String gradeDLiteral;
  do {
    stdout.write("Write the requested class(example 11.d): ");
    gradeDLiteral = stdin.readLineSync() ?? "";
  } while (gradeDLiteral.isEmpty);
  if (!(SchoolClass.database.containsKey(gradeDLiteral))) {
    throw Exception("That class doesn't exist");
  }
  return SchoolClass.database[gradeDLiteral]!;
}

void printStudentlist(SchoolClass? schoolClass) {
  for (Student student in schoolClass!.studentsList) {
    print(student);
  }
}

Student requestStudent() {
  late String id;
  do {
    stdout.write("Input the id of the student: ");
    id = stdin.readLineSync() ?? "";
    if (id.isEmpty) {
      print("Input shouldn't be null or empty!");
    }
  } while (id.isEmpty);

  if (!Student.database.containsKey(id)) {
    throw Exception("There is no student with the id: $id.");
  }
  return Student.database[id]!;
}

void addStudentToClass() {
  Student student = requestStudent();
  String key = requestSchoolClassKey();
  SchoolClass.database[key]!.studentsList.add(student);
  print("Student: ${student.name} succesfully added to the Class");
}
