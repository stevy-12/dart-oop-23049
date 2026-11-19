class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor (done for you)
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // EXAMPLE: getter for owner (done for you)
  String get owner {
    return _owner;
  }

  // TODO 1: getter for balance
  // I did the same as the owner getter, but it returns an int
  int get balance {
    return _balance;
  }

  // EXAMPLE: setter for owner, with a rule (done for you)
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // EXAMPLE: a method (done for you)
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: topUp
  // Only amounts from 500 to 50000 are accepted, like the rule says
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance = _balance + amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: pay
  // If the fare is bigger than the money on the card, the card is declined
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance = _balance - fare;
      print('Paid $fare RWF');
    }
  }
}

class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor (done for you)
  // super builds the BusCard part first, then I save the discount
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // EXAMPLE: override showInfo (done for you)
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay
  // First I calculate the discount, then the parent pay takes the rest
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 49, L = 9
  // Starting balance = 1490 RWF, Bus fare = 249 RWF, Discount = 19%

  // EXAMPLE: create a card and test the setter
  BusCard card = BusCard('Firstname', 1490);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5: change the owner to my full name
  card.owner = 'Firstname Lastname';
  card.showInfo();

  // TODO 6: 100 is too small so it must be refused, 2000 is ok
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay the bus fare 2 times
  card.pay(249);
  card.pay(249);
  card.showInfo();

  // TODO 8: student card with my name, my balance and my discount
  StudentCard student = StudentCard('Firstname Lastname', 1490, 19);

  // TODO 9: pay the fare once with the student card
  student.pay(249);
  student.showInfo();
}
