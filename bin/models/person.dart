class Person {
  static Map<String, Person> database = {};
  String name;
  String surName;
  String formattedBirthday;
  String id;
  late int birthD;
  late int birthM;
  late int birthY;

  Person(this.name, this.surName, this.formattedBirthday, this.id) {
    birthD = int.parse(formattedBirthday.split('.')[0]);
    birthM = int.parse(formattedBirthday.split('.')[1]);
    birthY = int.parse(formattedBirthday.split('.')[2]);
    if (!isValidBirthday()) {
      throw Exception("Birthday is not valid");
    }
    if (database.containsKey(id)) {
      throw Exception("Person with that id already exist.");
    }
    database[id] = this;
  }

  Person.eren()
    : name = "Eren",
      surName = "Yeager",
      formattedBirthday = "30.03.835",
      id = "350330090909",
      birthD = 30,
      birthM = 3,
      birthY = 835 {
    database[id] = this;
  }

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

  @override
  String toString() {
    return 'Person{name: $name, surName: $surName, formattedBirthday: $formattedBirthday, birthD: $birthD, birthM: $birthM, birthY: $birthY, id: $id}';
  }
}
