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

  Student student = Student(
    name,
    surName,
    formattedBirthday,
    id,
    school,
    scgl,
    gradeList,
  );
  addStudentToClass(student);
  print("The Student with id: $id succesfully created");
}

void createSchoolClass() {
  late String gradeDLiteral;
  do {
    stdout.write("Write the class gradeDotLiteral(example 11.d): ");
    gradeDLiteral = stdin.readLineSync() ?? "";
  } while (gradeDLiteral.isEmpty || SchoolClass.checkExistence(gradeDLiteral));
  List<Student> studentList = [];
  if (askForYON("Do you want to add the students to Class?")) {
    stdout.write("How much students are in the class ");
    int count = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;
    for (int i = 0; i < count; i++) {
      studentList.add(inputStudent());
    }
  }
  SchoolClass(studentList, gradeDLiteral);
}

String todayAsString() {
  DateTime today = DateTime.now();
  return "${today.year}-${today.month}-${today.day}";
}

bool isValidAttendance(String status) {
  if (!["p", "l", "e", "a"].contains(status)) {
    print("Given status is invalid!");
    return false;
  }
  return true;
}

void markAttendanceOfStudent([Student? student]) {
  student ??= requestStudent();
  late String status;
  do {
    stdout.write("Input the status(p/a/l/e): ");
    status = stdin.readLineSync() ?? "";
  } while (!isValidAttendance(status));

  String date = askForYON("Do you want to mark the attendance for today?")
      ? todayAsString()
      : dateAsString();

  student.markAttendance(date, status);
}

String dateAsString() {
  stdout.write("Input the date format(2012-02-27): ");
  String date = stdin.readLineSync() ?? "";
  return DateTime.tryParse(date).toString();
}

void markAttendanceOfClass() {
  SchoolClass schoolClass = requestSchoolClass();
  String date = askForYON("Do you want to mark the attendance for today?")
      ? todayAsString()
      : dateAsString();
  for (Student student in schoolClass.studentsList) {
    late String status;
    do {
      stdout.write("Input the status for ${student.surName} ${student.name}(p/a/l/e): ");
      status = stdin.readLineSync() ?? "";
    } while (!isValidAttendance(status));
    student.markAttendance(date, status);
  }
}

String requestSchoolClassKey() {
  late String gradeDLiteral;
  do {
    stdout.write("Write the requested class(example 11.d): ");
    gradeDLiteral = stdin.readLineSync() ?? "";
  } while (gradeDLiteral.isEmpty || SchoolClass.checkExistence(gradeDLiteral));
  return gradeDLiteral;
}

SchoolClass requestSchoolClass() {
  late String gradeDLiteral;
  do {
    stdout.write("Write the requested class(example 11.d): ");
    gradeDLiteral = stdin.readLineSync() ?? "";
  } while (gradeDLiteral.isEmpty || !SchoolClass.checkExistence(gradeDLiteral));
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

void addStudentToClass([Student? student]) {
  student ??= requestStudent(); // ??=    is equal to   if(student == null)
  SchoolClass schoolclass = requestSchoolClass();
  student.gradeDLiteral = schoolclass.gradeDLiteral;
  schoolclass.studentsList.add(student);
  print("Student: ${student.name} succesfully added to the Class");
}
//I just read about the work of object copy in dart, so changing the List by accessing it with key doesn't make sense.
//Because it's more cleaner, to change it just by copying the object and changing its list.

bool askForYON(String message) {
  late String choice;
  do {
    stdout.write("$message(y/n) : ");
    choice = stdin.readLineSync() ?? "";
    if (choice.isEmpty || !["y", "n"].contains(choice)) {
      print("Choice should be exact");
    }
  } while (choice.isEmpty || !["y", "n"].contains(choice));
  return choice == "y" ? true : false;
}

void newAcademicYear() {
  final scholClassList = SchoolClass.database.values.toList();
  for (SchoolClass schoolClass in scholClassList) {
    schoolClass.newAcademicYear();
  }
  print("New Academic Year has been set succesfully");
}
