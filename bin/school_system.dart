import "dart:io";
import "models/models.dart";

void main(){
  SchoolClass synypA = SchoolClass();
  print(synypA.studentsList);
  print(synypA.studentsList[0].name);

  while(true){
    print("""School Managing Application: 
    1. Get the students list
    2. Check the existence of Student
    3. Add the student to Class
    0. Exit""");

    String? answer = stdin.readLineSync();
  }
  
}