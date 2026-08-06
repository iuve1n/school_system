import 'dart:io';
import '../models/models.dart';

Person inputPerson(){
  stdout.write("Input the name: ");
  final name = stdin.readLineSync() ?? "Empty input";
  
  stdout.write("Input the Surname: ");
  final surName = stdin.readLineSync() ?? "Empty input";

  stdout.write("Input the Birthday(dd.mm.yyyy): ");
  final formattedBirthday = stdin.readLineSync() ?? "Empty input";

  return Person(name, surName, formattedBirthday);
  //I will continue the work with parsing the birthD, birthM and birthY later
}