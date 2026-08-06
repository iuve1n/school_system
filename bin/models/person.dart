class Person {
  String name;
  String surName;
  String formattedBirthday;
  late int birthD;
  late int birthM;
  late int birthY;

  Person(this.name, this.surName, this.formattedBirthday){
    birthD = int.parse(formattedBirthday.split('.')[0]);
    birthM = int.parse(formattedBirthday.split('.')[1]);
    birthY = int.parse(formattedBirthday.split('.')[2]);
    if(notValidBirthday()) throw Exception();
  }

  Person.eren() :
    name = "Eren",
    surName = "Yeager",
    formattedBirthday = "30.03.835",
    birthD = 30,
    birthM = 3,
    birthY = 835;
  
  bool notValidBirthday() =>birthY < 1900 || birthY > 2021;
}
