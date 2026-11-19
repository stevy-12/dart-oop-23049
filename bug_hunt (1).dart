class Phone {
  // Bug 1 fixed: the fields now have a starting value
  String _brand = '';
  int _battery = 0;

  Phone(String brand, int battery) {
    _brand = brand;
    _battery = battery;
  }

  int get battery {
    return _battery;
  }

  // Bug 4 fixed: setter added, only accepts 0 to 100
  set battery(int value) {
    if (value >= 0 && value <= 100) {
      _battery = value;
    } else {
      print('Error: battery must be 0 to 100');
    }
  }
}

class SmartPhone extends Phone {
  String _system = '';

  // Bug 2 fixed: super builds the Phone part first
  SmartPhone(String brand, int battery, String system) : super(brand, battery) {
    _system = system;
  }

  // Bug 3 fixed: I removed @override because Phone has no restart method
  void restart() {
    print('Restarting $_system');
  }
}

void main() {
  // Not a bug: "new" is optional in Dart but it is still allowed
  Phone p = new Phone('Tecno', 50);
  p.battery = 100;

  // Bug 5 fixed: battery is a getter, so no () after it
  print(p.battery);
}
