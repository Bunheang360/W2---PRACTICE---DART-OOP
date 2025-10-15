enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address(this.street, this.city, this.zipCode);

  @override
  String toString() => '$street, $city, $zipCode';
}

class Employee {
  final String _name;
  final double _baseSalary;
  final Address _address;
  final List<Skill> _skill;
  final int _yearOfExp;

  Employee(
    this._name,
    this._baseSalary,
    this._address,
    this._skill,
    this._yearOfExp,
  );

  Employee.mobileDeveloper(String name, Address address, int years)
    : _name = name,
      _baseSalary = 40000,
      _address = address,
      _skill = [Skill.FLUTTER, Skill.DART, Skill.OTHER],
      _yearOfExp = years;

  String get name => _name;
  double get baseSalary => _baseSalary;
  Address get address => _address;
  List<Skill> get skills => _skill;
  int get yearOfExp => _yearOfExp;

  double salaryCalculator() {
    double salary = _baseSalary + (_yearOfExp * 2000);

    for (var skill in _skill) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;

        case Skill.DART:
          salary += 3000;
          break;

        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }
    return salary;
  }

  void printDetails() {
    print(
        'Employee: $_name \n'
        'Address : $_address \n'
        'Skill: ${_skill.map((s) => s.name).join(", ")} \n'
        'Year of Experience: $_yearOfExp' ' Year\n'
        'Salary : \$${salaryCalculator().toStringAsFixed(2)}\n'
    );
  }
}

void main() {
  var emp1 = Employee(
      'Sokea',
      40000,
      Address('st. #62', 'Phnom Penh', '1234'),
      [Skill.FLUTTER, Skill.OTHER],
      2,
  );

  var emp2 = Employee(
      'Ronan',
      45000,
      Address('st. 55', 'Phnom Penh', '1234'),
      [Skill.FLUTTER, Skill.DART],
      10,
  );

  emp1.printDetails();
  emp2.printDetails();
}
