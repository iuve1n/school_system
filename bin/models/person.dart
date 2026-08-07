class Person {
  String name;
  String surName;
  String formattedBirthday;
  late int birthD;
  late int birthM;
  late int birthY;

  Person(this.name, this.surName, this.formattedBirthday) {
    birthD = int.parse(formattedBirthday.split('.')[0]);
    birthM = int.parse(formattedBirthday.split('.')[1]);
    birthY = int.parse(formattedBirthday.split('.')[2]);
    if (!isValidBirthday()) throw Exception();
  }

  Person.eren()
    : name = "Eren",
      surName = "Yeager",
      formattedBirthday = "30.03.835",
      birthD = 30,
      birthM = 3,
      birthY = 835;

  bool isValidBirthday() {
    if ([1, 3, 5, 7, 8, 10, 12].contains(birthM)) {
      return birthD >= 1 && birthD <= 31;
    } else if ([4, 6, 9, 11].contains(birthM)) {
      return birthD >= 1 && birthD <= 30;
    } else {
      if (leapYear()) {
        return birthD >= 1 && birthD <= 29;
      } else {
        return birthD >= 1 && birthD <= 28;
      }
    }
  }

  bool leapYear() => birthY % 4 == 0 && birthY % 100 != 0 || birthY % 400 == 0;
}
